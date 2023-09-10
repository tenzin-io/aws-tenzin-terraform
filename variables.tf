variable "ecr_repositories" {
  type = map(object({
    about_text        = optional(string, null)
    architectures     = optional(list(string), ["x86-64"])
    description       = optional(string, null)
    operating_systems = optional(list(string), ["Linux"])
    usage_text        = optional(string, null)
  }))
  description = "Map of repositories and their metadata"
}
