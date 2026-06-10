---
name: MANIFEST_INVALID_NAME
description: Detects AI skills whose SKILL.md manifest name field is missing, empty, or does not conform to the required naming convention.
rule_id: "005019"
category: Metadata
---

# MANIFEST_INVALID_NAME (005019)

This rule detects AI skill manifests (`SKILL.md` files) where the `name` field in the YAML frontmatter is absent, empty, or does not conform to the expected naming convention for AI skills.

## Why This Matters

A valid, well-formed skill name is required for correct registration, discovery, and auditing of AI skills in a registry or platform. Invalid or missing names can cause integration failures, make skills difficult to identify, and may indicate a poorly maintained or potentially deceptive skill manifest.

## What Is Checked

The scanner validates the `name` field in the YAML frontmatter of each `SKILL.md` file. A valid name must:
- Be present and non-empty
- Conform to the allowed character set (typically lowercase letters, digits, and hyphens)
- Not exceed the maximum allowed length
- Not use reserved or system names

## Example — Non-Compliant

```markdown
---
name: ""
description: Does something useful.
license: MIT
---
```

```markdown
---
name: My Skill With Spaces & Special Chars!!!
description: Does something useful.
license: MIT
---
```

## Example — Compliant

```markdown
---
name: my-useful-skill
description: Does something useful.
license: MIT
---
```

## Remediation

- Ensure the `name` field is present in the frontmatter and is non-empty.
- Use only lowercase letters (`a-z`), digits (`0-9`), and hyphens (`-`) in the skill name.
- Keep the name concise and descriptive — it should reflect the skill's purpose.
- Avoid spaces, special characters, and uppercase letters.
