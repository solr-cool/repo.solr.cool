load 'helper/bats-support/load'
load 'helper/bats-assert/load'

@test "Launch Solr" {
  docker-compose -f $BATS_TEST_DIRNAME/docker-compose.yaml up -d
  sleep 15
}

@test "Solr up and running" {
  run curl -fs "http://localhost:8983/solr/"
  assert_success
}

@test "solr package add-repo" {
  run docker exec -it test_solr_1 solr package add-repo solr.cool http://repo:8080
  assert_success
  assert_output --partial 'Added repository: solr.cool'
}

@test "solr package list-available" {
  run docker exec -it test_solr_1 solr package list-available
  assert_success
  assert_output --partial 'sematext-example'
  assert_output --partial 'Querqy'
}

@test "Tear Solr down" {
  docker-compose -f $BATS_TEST_DIRNAME/docker-compose.yaml down
}