resource "google_storage_bucket" "test_bucket" {

  name = "${lower(var.environment)}-my-test-bucket-${var.unique_id}"

  location = "US"

  uniform_bucket_level_access = true
}

resource "snowflake_database" "test_database" {

  name         = "test_database"
  is_transient = false

}