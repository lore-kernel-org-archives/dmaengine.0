Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,1/6] dmaengine: xilinx_dma: Check for channel idle state before submitting dma descriptor
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20171218041711.GN18649@localhost>
Date: Mon, 18 Dec 2017 09:47:11 +0530
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appanad@xilinx.com, lars@metafoo.de, akinobu.mita@gmail.com, joabreu@synopsys.com, mike.looijmans@topic.nl, kedare06@gmail.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gVGh1LCBEZWMgMDcsIDIwMTcgYXQgMTA6NTE6MDJBTSArMDUzMCwgS2VkYXJlc3dhcmEgcmFv
IEFwcGFuYSB3cm90ZToKCj4gQEAgLTIwMjksNiArMjAwNiw3IEBAIHN0YXRpYyBpbnQgeGlsaW54
X2RtYV90ZXJtaW5hdGVfYWxsKHN0cnVjdCBkbWFfY2hhbiAqZGNoYW4pCj4gIAo+ICAJLyogUmVt
b3ZlIGFuZCBmcmVlIGFsbCBvZiB0aGUgZGVzY3JpcHRvcnMgaW4gdGhlIGxpc3RzICovCj4gIAl4
aWxpbnhfZG1hX2ZyZWVfZGVzY3JpcHRvcnMoY2hhbik7Cj4gKwljaGFuLT5pZGxlID0gdHJ1ZTsK
PiAgCj4gIAlpZiAoY2hhbi0+Y3ljbGljKSB7Cj4gIAkJcmVnID0gZG1hX2N0cmxfcmVhZChjaGFu
LCBYSUxJTlhfRE1BX1JFR19ETUFDUik7Cj4gQEAgLTIzNDQsNiArMjMyMiwxMiBAQCBzdGF0aWMg
aW50IHhpbGlueF9kbWFfY2hhbl9wcm9iZShzdHJ1Y3QgeGlsaW54X2RtYV9kZXZpY2UgKnhkZXYs
Cj4gIAljaGFuLT5oYXNfc2cgPSB4ZGV2LT5oYXNfc2c7Cj4gIAljaGFuLT5kZXNjX3BlbmRpbmdj
b3VudCA9IDB4MDsKPiAgCWNoYW4tPmV4dF9hZGRyID0geGRldi0+ZXh0X2FkZHI7Cj4gKwkvKiBU
aGlzIHZhcmlhYmxlIGVudXNyZXMgdGhhdCBkZXNjcmlwb3RycyBhcmUgbm90CgkJCQkgICAgICBe
Xl5eXl5eXl5eCgp0eXBvCg==
