Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [09/46] dmaengine: cppi41: use dmaenginem_async_device_register to simplify the code
From: Tony Lindgren <tony@atomide.com>
Message-Id: <20180808071652.GP99251@atomide.com>
Date: Wed, 8 Aug 2018 00:16:52 -0700
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Huang Shijie <sjhuang@iluvatar.ai>, Alexandre Bailon <abailon@baylibre.com>, vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dave.jiang@intel.com, radhey.shyam.pandey@xilinx.com, appana.durga.rao@xilinx.com, jmkrzyszt@gmail.com, gomonovych@gmail.com, keescook@chromium.org, horms+renesas@verge.net.au, geert+renesas@glider.be, shawnguo@kernel.org, baoyou.xie@linaro.org, michal.simek@xilinx.com, baohua@kernel.org, ludovic.desroches@microchip.com, linus.walleij@linaro.org, david.brown@linaro.org
List-ID: <dmaengine.vger.kernel.org>

KiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPiBbMTgwODA3IDA3OjA1XToK
PiBCdXQgZG9lcyB0aGUgcmVtb3ZlZCB0aHJlZSBsaW5lcyB3b3J0aCBvdmVyIHRoZSBjbGFyaXR5
IG9mIGhvdyB0aGUKPiBtb2R1bGUgcmVtb3ZhbCBpcyBwcm9jZWVkaW5nPwo+IAo+IEFsZXhhbmRy
ZSBhbmQgVG9ueSBwdXQgbG90cyBvZiBlZmZvcnQgdG8gdGhlIGNwcGk0IGRyaXZlciwgSSBsZXQg
dGhlbQo+IGRlY2lkZS4KClVwIHRvIHlvdSBndXlzIGFzIGZhciBhcyBJJ20gY29uY2VybmVkLgoK
VG9ueQotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVu
c3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9t
b0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2Vy
bmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
