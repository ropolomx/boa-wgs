rule abricate_amr:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/abricate_amr.txt'
    log:
        'logs/abricate/{sample}.log'
    conda:
        '../envs/abricate.yaml'
    shell:
        '(abricate --threads 4 --mincov 60 --db ncbi {input} > {output}) 2> {log}'

rule abricate_plasmid:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/abricate_plasmid.txt'
    log:
        'logs/abricate/{sample}.log'
    conda:
        '../envs/abricate.yaml'
    shell:
        '(abricate --threads 4 --mincov 60 --db plasmidfinder {input} > {output}) 2> {log}'

rule abricate_vf:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/abricate_vf.txt'
    log:
        'logs/abricate_vf/{sample}.log'
    conda:
        '../envs/abricate.yaml'
    shell:
        '(abricate --threads 4 --mincov 60 --db vfdb {input} > {output}) 2> {log}'

rule abricate_amr_summary:
    input:
        expand('{sample}/abricate_amr.txt', sample=SAMPLE.isolate)
    output:
        'amr_summary.txt'
    conda:
        '../envs/abricate.yaml'
    shell:
        'abricate --summary {input} > {output}'

rule abricate_vf_summary:
    input:
        expand('{sample}/abricate_vf.txt', sample=SAMPLE.isolate)
    output:
        'vf_summary.txt'
    conda:
        '../envs/abricate.yaml'
    shell:
        'abricate --summary {input} > {output}'

rule abricate_plasmid_summary:
    input:
        expand('{sample}/abricate_plasmid.txt', sample=SAMPLE.isolate)
    output:
        'plasmid_summary.txt'
    conda:
        '../envs/abricate.yaml'
    shell:
        'abricate --summary {input} > {output}'

