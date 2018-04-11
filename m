Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,2/6] dmaengine: xilinx_dma: Pass AXI4-Stream control words to netdev dma client
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180411090854.GY6014@localhost>
Date: Wed, 11 Apr 2018 14:38:55 +0530
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, radheys@xilinx.com, lars@metafoo.de, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBcHIgMDIsIDIwMTggYXQgMDQ6MDk6MDJQTSArMDUzMCwgUmFkaGV5IFNoeWFtIFBh
bmRleSB3cm90ZToKCj4gKwo+ICsJCWlmIChjaGFuLT54ZGV2LT5oYXNfYXhpZXRoX2Nvbm5lY3Rl
ZCkgewo+ICsJCQlzZWcgPSBsaXN0X2ZpcnN0X2VudHJ5KCZkZXNjLT5zZWdtZW50cywKPiArCQkJ
CQlzdHJ1Y3QgeGlsaW54X2F4aWRtYV90eF9zZWdtZW50LCBub2RlKTsKPiArCQkJaWYgKGNiLmNh
bGxiYWNrX3BhcmFtKSB7Cj4gKwkJCQlhcHBfdyA9ICh1MzIgKikgY2IuY2FsbGJhY2tfcGFyYW07
Cgp3aHkgYXJlIHlvdSBpbnRlcnByZXRpbmcgY2FsbGJhY2tfcGFyYW0/IFRoaXMgaXMgcGxhaW5s
eSB3cm9uZy4Kd2UgZG8gbm90IGtub3cgd2hhdCBpcyB0aGUgaW50ZXJwcmV0YXRpb24gb2YgY2Fs
bGJhY2tfcGFyYW0gYW5kIGl0IGlzCmludGVybmFsIHRvIHN1Ym1pdHRlci4KCldoYXQgZXhhY3Rs
eSBpcyB0aGUgcHJvYmxlbSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZT8KCj4gKwkJCQlodyA9ICZz
ZWctPmh3Owo+ICsJCQkJKmFwcF93ID0gaHctPnN0YXR1cyAmIFhJTElOWF9ETUFfTUFYX1RSQU5T
X0xFTjsKPiArCQkJCW1lbWNweShhcHBfdywgaHctPmFwcCwgc2l6ZW9mKHUzMikgKgo+ICsJCQkJ
CVhJTElOWF9ETUFfTlVNX0FQUF9XT1JEUyk7Cj4gKwkJCX0K
