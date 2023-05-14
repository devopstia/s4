```s
data "aws_db_snapshot" "example_snapshot" {
  db_snapshot_identifier = "your-db-snapshot-identifier"
}

data "aws_db_snapshot" "example_snapshot" {
  db_snapshot_identifier = format("%sArtifactorySnapshot", var.common_tags["Project"])
}

snapshot_identifier   = data.aws_db_snapshot.example_snapshot.id
```