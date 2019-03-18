rule abricate_ecoli_vf:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/abricate_ecoli_vf.txt'
    log:
        'logs/abricate_ecoli_vf/{sample}.log'
    shell:
        '(abricate --threads 4 --mincov 60 --db ecoli_vf {input} > {output}) 2> {log}'

rule abricate_ecoh:
    input:
        '{sample}/contigs.fa'
    output:
        '{sample}/abricate_ecoh.txt'
    log:
        'logs/abricate_ecoh/{sample}.log'
    shell:
        '(abricate --threads 4 --mincov 60 --db ecoh {input} > {output}) 2> {log}'

rule abricate_ecoli_vf_summary:
    input:
        expand('{sample}/abricate_ecoli_vf.txt', sample=SAMPLE)
    output:
        'ecoli_vf_summary.txt'
    shell:
        'abricate --summary {input} > {output}'

rule abricate_ecoh_summary:
    input:
        expand('{sample}/abricate_ecoh.txt', sample=SAMPLE)
    output:
        'ecoh_summary.txt'
    shell:
        'abricate --summary {input} > {output}'

