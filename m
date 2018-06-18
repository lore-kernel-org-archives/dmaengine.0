Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,06/14] mtd: rawnand: marvell: remove the dmaengine compat need
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <87h8lzriwg.fsf@belgarion.home>
Date: Mon, 18 Jun 2018 21:31:27 +0200
To: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Nicolas Pitre <nico@fluxnic.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

RGFuaWVsIE1hY2sgPGRhbmllbEB6b25xdWUub3JnPiB3cml0ZXM6Cgo+IE9uIFN1bmRheSwgSnVu
ZSAxNywgMjAxOCAwNzowMiBQTSwgUm9iZXJ0IEphcnptaWsgd3JvdGU6Cj4+IEFzIHRoZSBweGEg
YXJjaGl0ZWN0dXJlIHN3aXRjaGVkIHRvd2FyZHMgdGhlIGRtYWVuZ2luZSBzbGF2ZSBtYXAsIHRo
ZQo+PiBvbGQgY29tcGF0aWJpbGl0eSBtZWNoYW5pc20gdG8gYWNxdWlyZSB0aGUgZG1hIHJlcXVl
c3RvciBsaW5lIG51bWJlciBhbmQKPj4gcHJpb3JpdHkgYXJlIG5vdCBuZWVkZWQgYW55bW9yZS4K
Pj4KPj4gVGhpcyBwYXRjaCBzaW1wbGlmaWVzIHRoZSBkbWEgcmVzb3VyY2UgYWNxdWlzaXRpb24s
IHVzaW5nIHRoZSBtb3JlCj4+IGdlbmVyaWMgZnVuY3Rpb24gZG1hX3JlcXVlc3Rfc2xhdmVfY2hh
bm5lbCgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWFjayA8
ZGFuaWVsQHpvbnF1ZS5vcmc+Cj4KPiBTb21ldGhpbmcgd2VudCB3cm9uZyBoZXJlLCBidXQgeW91
IGNhbiBzaW1wbHkgZml4IHRoYXQgd2hlbiBhcHBseWluZyB0aGUgc2VyaWVzCj4gOikKSW5kZWVk
LCBmaXhlZCBiZWZvcmUgYXBwbHlpbmcgdG8gdGhlIHB4YS9mb3ItbmV4dCB0cmVlLgotLS0KUm9i
ZXJ0Ci0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1
YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9A
dmdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5l
bC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
