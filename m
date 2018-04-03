Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/15] dmaengine: pxa: make the filter function internal
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a0T3HV9ee4Kk7+Y16S-51SLzbn5fRBsr4bSV0ZQnthPVg@mail.gmail.com>
Date: Tue, 3 Apr 2018 09:13:34 +0200
To: kbuild test robot <lkp@intel.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, kbuild-all@01.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, IDE-ML <linux-ide@vger.kernel.org>, dmaengine@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Networking <netdev@vger.kernel.org>, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBcHIgMiwgMjAxOCBhdCA2OjM1IFBNLCBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4gd3JvdGU6Cgo+Cj4gICAgZHJpdmVycy9tdGQvbmFuZC9tYXJ2ZWxsX25hbmQuYzoy
NjIxOjE3OiBzcGFyc2U6IHVuZGVmaW5lZCBpZGVudGlmaWVyICdweGFkX2ZpbHRlcl9mbicKPj4+
IGRyaXZlcnMvbXRkL25hbmQvbWFydmVsbF9uYW5kLmM6MjYyMToxNzogc3BhcnNlOiBjYWxsIHdp
dGggbm8gdHlwZSEKPiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9tdGQvbmFuZC9t
YXJ2ZWxsX25hbmQuYzoyMTowOgo+ICAgIGRyaXZlcnMvbXRkL25hbmQvbWFydmVsbF9uYW5kLmM6
IEluIGZ1bmN0aW9uICdtYXJ2ZWxsX25mY19pbml0X2RtYSc6Cj4gICAgZHJpdmVycy9tdGQvbmFu
ZC9tYXJ2ZWxsX25hbmQuYzoyNjIxOjQyOiBlcnJvcjogJ3B4YWRfZmlsdGVyX2ZuJyB1bmRlY2xh
cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnZG1hX2ZpbHRl
cl9mbic/Cj4gICAgICAgZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbF9jb21wYXQobWFzaywgcHhh
ZF9maWx0ZXJfZm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+ICAgIGluY2x1ZGUvbGludXgvZG1hZW5naW5lLmg6MTQwODo0Njogbm90ZTogaW4gZGVm
aW5pdGlvbiBvZiBtYWNybyAnZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbF9jb21wYXQnCj4gICAg
ICBfX2RtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWxfY29tcGF0KCYobWFzayksIHgsIHksIGRldiwg
bmFtZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xgo+ICAgIGRyaXZlcnMvbXRkL25hbmQvbWFydmVsbF9uYW5kLmM6MjYyMTo0Mjogbm90ZTogZWFj
aCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1
bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiAgICAgICBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsX2Nv
bXBhdChtYXNrLCBweGFkX2ZpbHRlcl9mbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4gICAgaW5jbHVkZS9saW51eC9kbWFlbmdpbmUuaDoxNDA4OjQ2
OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICdkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVs
X2NvbXBhdCcKPiAgICAgIF9fZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbF9jb21wYXQoJihtYXNr
KSwgeCwgeSwgZGV2LCBuYW1lKQoKVGhlIGRyaXZlciBpcyBhIHJlcGxhY2VtZW50IGZvciB0aGUg
cHhhM3h4IG5hbmQgZHJpdmVyLCBzbyBpdCBub3cgaGFzCnRvIGdldCBjaGFuZ2VkIGFzIHdlbGwu
CgogICAgICAgQXJuZAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhl
IGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRv
IG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDov
L3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
