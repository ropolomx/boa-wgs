# After configuring, running snakemake -n in a clone of this repository should successfully execute a dry-run of the workflow.

import pandas as pd

configfile: "config.yaml"

REF = config["reference"]

# Target rules

rule all:
    input:
        # The first rule should define the default target files
        # Subsequent target rules can be specified below. They should start with all_*.


include: "rules/assemble.smk"
include: "rules/annotate.smk"
include: "rules/abricate.smk"
include: "rules/mlst.smk"
include: "rules/snippy.smk"
