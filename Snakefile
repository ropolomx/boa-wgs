# After configuring, running snakemake -n in a clone of this repository should successfully execute a dry-run of the workflow.

import pandas as pd

configfile: "config.yaml"

REF = config["reference"]
SAMPLE = pd.read_csv(config["samples"], sep = "\t").set_index("isolate", drop=False)

# Target rules

rule all:
    input:
        expand('{sample}/contigs.fa', sample=SAMPLE['isolate']),
        expand('{sample}/prokka/{sample}.gbk', sample=SAMPLE['isolate']),
        expand('{sample}/abricate_amr.txt', sample=SAMPLE['isolate']),
        expand('{sample}/mlst.txt', sample=SAMPLE['isolate'])

# Load modules

include:"rules/assemble.smk"
include: "rules/annotate.smk"
include: "rules/abricate.smk"
include: "rules/mlst.smk"
#include: "rules/snippy.smk"
