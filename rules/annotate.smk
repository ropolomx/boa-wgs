rule prokka:
    input:
        '{sample}/contigs.fa'
    output:
        function='{sample}/prokka/{sample}.ffn',
        amino='{sample}/prokka/{sample}.faa',
        nucl='{sample}/prokka/{sample}.fna',
        fsa='{sample}/prokka/{sample}.fsa',
        genbank='{sample}/prokka/{sample}.gbk',
        gff='{sample}/prokka/{sample}.gff',
        sqn='{sample}/prokka/{sample}.sqn',
        tbl='{sample}/prokka/{sample}.tbl',
        tsv='{sample}/prokka/{sample}.tsv',
        summary='{sample}/prokka/{sample}.txt',
        error='{sample}/prokka/{sample}.err',
        log_file='{sample}/prokka/{sample}.log'
    params:
        prefix='{sample}',
        outdir='{sample}/prokka',
        cpus=config["prokka_cpus"]
    conda:
        "../envs/prokka.yaml"
    shell:
        'prokka --kingdom Bacteria --prefix {params.prefix} --outdir {params.outdir} --cpus {params.cpus} --force {input}'


