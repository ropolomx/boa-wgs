rule shovill:
   input:
        forward=lambda wildcards: SAMPLE.loc[wildcards.sample, 'forward'],
        reverse=lambda wildcards: SAMPLE.loc[wildcards.sample, 'reverse']
    output:
        contigs='{sample}/contigs.fa',
        graph='{sample}/contigs.gfa'
    params:
        dir='{sample}'
    shell:
        'shovill --outdir {params.dir} --ram 32 --cpus 32 --R1 {input.forward} --R2 {input.reverse} --trim --force'


