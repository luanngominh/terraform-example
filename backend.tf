terraform {
	backend "remote" {
		organization = "meocon"

		workspaces {
			name = "example-dev"
		}
	}
}
