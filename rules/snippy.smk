rule snippy:
    input:
        ref=REF,
        forward=lambda wildcards: SAMPLE.loc[wildcards.sample, 'forward'],
        reverse=lambda wildcards: SAMPLE.loc[wildcards.sample, 'reverse']
    output:
        '{sample}/snippy/snps.vcf'
    params:
        outdir='{sample}'
    shell:
        'snippy --cpus 16 --outdir {params.outdir} --ref {input.ref} --R1 {input.forward} --R2 {input.reverse} --force'

rule snippy_core:
    input:
        ref=REF,
        snippy_dirs=expand('{sample}', sample=SAMPLE.isolate)
    output:
        'core.aln'
    shell:
        'snippy-core --ref {input.ref} {input.snippy_dirs}'

rule snp_distances:
    input:
        'core.aln'
    output:
        'distances.tab'
    shell:
        'snp-dists -b {input} > {output}'
