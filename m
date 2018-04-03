Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [14/15] ARM: pxa: change SSP devices allocation
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a2hYWO2eweg3zpR7iJoqtH4uxJLAxJAno7L96G7nA2HxQ@mail.gmail.com>
Date: Tue, 3 Apr 2018 09:06:46 +0200
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, IDE-ML <linux-ide@vger.kernel.org>, dmaengine@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Networking <netdev@vger.kernel.org>, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBcHIgMiwgMjAxOCBhdCA0OjI2IFBNLCBSb2JlcnQgSmFyem1payA8cm9iZXJ0Lmph
cnptaWtAZnJlZS5mcj4gd3JvdGU6Cgo+Cj4gK3N0YXRpYyBzdHJ1Y3QgcHhhX3NzcF9pbmZvIHB4
YV9zc3BfaW5mb3NbXSA9IHsKPiArICAgICAgIHsgLmRtYV9jaGFuX3J4X25hbWUgPSAic3NwMV9y
eCIsIC5kbWFfY2hhbl90eF9uYW1lID0gInNzcDFfdHgiLCB9LAo+ICsgICAgICAgeyAuZG1hX2No
YW5fcnhfbmFtZSA9ICJzc3AxX3J4IiwgLmRtYV9jaGFuX3R4X25hbWUgPSAic3NwMV90eCIsIH0s
Cj4gKyAgICAgICB7IC5kbWFfY2hhbl9yeF9uYW1lID0gInNzcDJfcngiLCAuZG1hX2NoYW5fdHhf
bmFtZSA9ICJzc3AyX3R4IiwgfSwKPiArICAgICAgIHsgLmRtYV9jaGFuX3J4X25hbWUgPSAic3Nw
Ml9yeCIsIC5kbWFfY2hhbl90eF9uYW1lID0gInNzcDJfdHgiLCB9LAo+ICsgICAgICAgeyAuZG1h
X2NoYW5fcnhfbmFtZSA9ICJzc3AzX3J4IiwgLmRtYV9jaGFuX3R4X25hbWUgPSAic3NwM190eCIs
IH0sCj4gKyAgICAgICB7IC5kbWFfY2hhbl9yeF9uYW1lID0gInNzcDNfcngiLCAuZG1hX2NoYW5f
dHhfbmFtZSA9ICJzc3AzX3R4IiwgfSwKPiArICAgICAgIHsgLmRtYV9jaGFuX3J4X25hbWUgPSAi
c3NwNF9yeCIsIC5kbWFfY2hhbl90eF9uYW1lID0gInNzcDRfdHgiLCB9LAo+ICsgICAgICAgeyAu
ZG1hX2NoYW5fcnhfbmFtZSA9ICJzc3A0X3J4IiwgLmRtYV9jaGFuX3R4X25hbWUgPSAic3NwNF90
eCIsIH0sCj4gK307CgpUaGlzIHBhcnQgbG9va3Mgb2RkIHRvIG1lLCB5b3UncmUgYWRkaW5nIGFu
IGV4dHJhIGxldmVsIG9mIGluZGlyZWN0aW9uIHRvCmRvIHR3byBzdGFnZXMgb2YgbG9va3VwcyBp
biBzb21lIGZvcm0gb2YgcGxhdGZvcm0gZGF0YS4KCldoeSBjYW4ndCB5b3UganVzdCBhbHdheXMg
dXNlICJyeCIgYW5kICJ0eCIgYXMgdGhlIG5hbWVzIGhlcmU/CgooYWxzbywgSSBkb24ndCBzZWUg
d2h5IGVhY2ggbGluZSBpcyBkdXBsaWNhdGVkLCBidXQgSSdtIHN1cmUgdGhlcmUncwphbiBlYXN5
IGFuc3dlciBmb3IgdGhhdCkuCgogICAgICAgQXJuZAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0
aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJv
ZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRv
bW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
