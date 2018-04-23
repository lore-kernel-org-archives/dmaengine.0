Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [09/15] net: irda: pxaficp_ir: remove the dmaengine compat need
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180423083720.GA25048@kroah.com>
Date: Mon, 23 Apr 2018 10:37:20 +0200
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Pravin Shedge <pravin.shedge4linux@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBcHIgMDIsIDIwMTggYXQgMDQ6MjY6NTBQTSArMDIwMCwgUm9iZXJ0IEphcnptaWsg
d3JvdGU6Cj4gQXMgdGhlIHB4YSBhcmNoaXRlY3R1cmUgc3dpdGNoZWQgdG93YXJkcyB0aGUgZG1h
ZW5naW5lIHNsYXZlIG1hcCwgdGhlCj4gb2xkIGNvbXBhdGliaWxpdHkgbWVjaGFuaXNtIHRvIGFj
cXVpcmUgdGhlIGRtYSByZXF1ZXN0b3IgbGluZSBudW1iZXIgYW5kCj4gcHJpb3JpdHkgYXJlIG5v
dCBuZWVkZWQgYW55bW9yZS4KPiAKPiBUaGlzIHBhdGNoIHNpbXBsaWZpZXMgdGhlIGRtYSByZXNv
dXJjZSBhY3F1aXNpdGlvbiwgdXNpbmcgdGhlIG1vcmUKPiBnZW5lcmljIGZ1bmN0aW9uIGRtYV9y
ZXF1ZXN0X3NsYXZlX2NoYW5uZWwoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgSmFyem1p
ayA8cm9iZXJ0LmphcnptaWtAZnJlZS5mcj4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2lyZGEv
ZHJpdmVycy9weGFmaWNwX2lyLmMgfCAxNCArKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKClRoaXMgZmlsZSBpcyBubyBsb25n
ZXIgaW4gTGludXMncyB0cmVlIDopCgp0aGFua3MsCgpncmVnIGstaAotLS0KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIg
aW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9y
ZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5m
by5odG1sCg==
