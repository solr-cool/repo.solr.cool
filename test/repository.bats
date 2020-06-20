load 'helper/bats-support/load'
load 'helper/bats-assert/load'
load 'helper/docker-support'

@test "Launch Solr" {
  run docker-compose -f $BATS_TEST_DIRNAME/docker-compose.yaml up -d
  docker_wait_for_log solr 120 "o.e.j.s.Server Started"
}

@test "Solr up and running" {
  run curl -fs "http://localhost:8983/solr/"
  assert_success
}

@test "solr package add-repo" {
  run docker exec -it solr solr package add-repo solr.cool http://repo:8080
  assert_success
  assert_output --partial 'Added repository: solr.cool'
}

@test "solr package list-available" {
  run docker exec -it solr solr package list-available
  assert_success
  assert_output --partial 'sematext-example'
  assert_output --partial 'Querqy'
}

@test "Tear Solr down" {
  docker-compose -f $BATS_TEST_DIRNAME/docker-compose.yaml down
}