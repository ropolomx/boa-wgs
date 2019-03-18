rule mlst:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/mlst.txt'
    params:
        cpus=config["default_cpus"]
    shell:
        'mlst --threads {params.cpus} {input} > {output}'
