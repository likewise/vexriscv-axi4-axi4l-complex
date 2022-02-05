all: axi4_xbar.v

axi:
	git clone https://github.com/pulp-platform/axi.git

axi4_xbar.v: axi
	python3 ./axi/scripts/axi_intercon_gen.py axi4_xbar.xml
	mv axi_intercon.v axi4_xbar.v
	mv axi_intercon.vh axi4_xbar.vh
