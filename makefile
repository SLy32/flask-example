run:
	docker run -p 5015:5015 validation:latest

prep:
	docker run -p 5015:5015 identification:latest

b_idn:
	docker build -t identification -f Dockerfile_identification .

b_extract:
	docker build -t extraction -f Dockerfile_data_extraction .

r_idn:
	docker run --rm -it identification:latest

r_extract:
	docker run --rm -it extraction:latest

r_extract_test:
	docker run --rm --entrypoint='pytest' extraction:latest

go_doc_idn:
	docker run --rm --entrypoint="bash" -it identification

scrap:
	docker build -t state-site-scraper:test -f scrapers/state_site_scrapers/Dockerfile_arkanzas .

scrap_run:
	docker run --rm state-site-scraper:test

ark_run:
	docker run  --rm  -i -v /Users/viachaslau_kazakou/Projects/data-processing/scrapers/state_site_scrapers/arkanzas/Downloads:/app/state_site_scrapers/arkanzas/Downloads  arkanzas-scraper:test

ark_home:
	docker run  --rm  -i -v /Users/slava/PycharmProjects/ark_firefox/Downloads:/app/state_site_scrapers/arkanzas/Downloads  arkanzas-scraper:test

ph_build:
	docker build -t pheweb -f ./Dockerfile .

bash:
	docker run --rm --entrypoint="bash" -it docker-test_data

ph_start:
	docker run  --rm  -i --publish 5000:5000 pheweb

ph_start_port:
	docker run  --rm  -i --publish 5000:5000   -v /Users/viachaslau_kazakou/Projects/my-pheweb/generated-by-pheweb/tmp:/app/generated-by-pheweb/tmp/  pheweb