rule mlst:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/mlst.txt'
    params:
        cpus=config["default_cpus"]
    conda:
        '../envs/mlst.yaml'
    shell:
        'mlst --threads {params.cpus} {input} > {output}'
