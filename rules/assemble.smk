rule shovill:
    input:
        forward=lambda wildcards: SAMPLE.loc[wildcards.sample, 'forward'],
        reverse=lambda wildcards: SAMPLE.loc[wildcards.sample, 'reverse']
    output:
        contigs='{sample}/contigs.fa',
        graph='{sample}/contigs.gfa'
    params:
        dir='{sample}',
        cpus=config["shovill_cpus"],
        ram=config["shovill_ram"]
    
    conda:
        "../envs/shovill.yaml"
    shell:
        'shovill --outdir {params.dir} --ram {params.ram} --cpus {params.cpus} --R1 {input.forward} --R2 {input.reverse} --trim --force'
