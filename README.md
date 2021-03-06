# Snakemake workflow: Boa-WGS

[![Snakemake](https://img.shields.io/badge/snakemake-≥3.12.0-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Build Status](https://travis-ci.org/snakemake-workflows/boa-wgs.svg?branch=master)](https://travis-ci.org/snakemake-workflows/boa-wgs)

This Snakemake workflow is for the analysis of whole genome sequences of bacteria.

The steps that are included are:

* Assembly with Shovill (including trimming)
* Genome annotation with Prokka
* Contig search with abricate (antimicrobial resistance genes, virulence factors, plasmids)
* MLST typing with `mlst`
 

Define the entry point of the workflow in the `Snakefile` and the main configuration in the `config.yaml` file.

## Authors

* Rodrigo O. Polo (@ropolomx)

## Usage

### Step 1: Install workflow

If you simply want to use this workflow, download and extract the [latest release](https://github.com/snakemake-workflows/boa-wgs/releases).
If you intend to modify and further develop this workflow, fork this repository. Please consider providing any generally applicable modifications via a pull request.

In any case, if you use this workflow in a paper, don't forget to give credits to the authors by citing the URL of this repository and, if available, its DOI (see above).

The conda package manager would have to be installed in order to use the conda directive.

### Step 2: Configure workflow

Configure the workflow according to your needs via editing the file `config.yaml`.

### Step 3: Execute workflow

Test your configuration by performing a dry-run via

    snakemake -n

Execute the workflow locally via

    snakemake --cores $N

using `$N` cores or run it in a cluster environment via

    snakemake --cluster qsub --jobs 100 --use-conda

or

    snakemake --drmaa --jobs 100 --use-conda

See the [Snakemake documentation](https://snakemake.readthedocs.io) for further details.

## Testing

Tests cases are in the subfolder `.test`. They should be executed via continuous integration with Travis CI.
