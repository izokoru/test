---
name: MANIFEST_MISSING_LICENSE
description: Detects AI skills that are missing a license declaration in their SKILL.md manifest frontmatter.
rule_id: "005011"
category: Metadata
---

# MANIFEST_MISSING_LICENSE (005011)

This rule detects AI skill manifests (`SKILL.md` files) that do not declare a `license` field in their YAML frontmatter.

## Why This Matters

A missing license declaration makes it ambiguous whether a skill can be freely used, modified, or redistributed. For AI skills distributed via registries or shared within organizations, license clarity is essential for legal compliance and trust.

## What Is Checked

The scanner reads the YAML frontmatter block (between `---` delimiters) of each `SKILL.md` file and checks whether a `license` key is present with a non-empty value.

## Example — Non-Compliant

```markdown
---
name: my-skill
description: Does something useful.
---
```

## Example — Compliant

```markdown
---
name: my-skill
description: Does something useful.
license: MIT
---
```

## Remediation

Add a `license` field to the frontmatter of your `SKILL.md` file. Use a standard SPDX license identifier (e.g. `MIT`, `Apache-2.0`, `GPL-3.0`) or a custom license name that makes the usage terms clear.
