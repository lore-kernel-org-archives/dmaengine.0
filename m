Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,03/14] dmaengine: pxa: add a default requestor policy
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180617170217.24177-4-robert.jarzmik@free.fr>
Date: Sun, 17 Jun 2018 19:02:06 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Nicolas Pitre <nico@fluxnic.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>
List-ID: <dmaengine.vger.kernel.org>

QXMgd2hhdCBmb3JtZXIgZHJjbXIgLTEgdmFsdWUgbWVhbnQsIGFkZCBhIHRoaXMgYXMgYSBkZWZh
dWx0IHRvIGVhY2gKY2hhbm5lbCwgaWUuIHRoYXQgYnkgZGVmYXVsdCBubyByZXF1ZXN0b3IgbGlu
ZSBpcyB1c2VkLgoKVGhpcyBpcyBzcGVjaWZpY2FsbHkgdXNlZCBmb3IgbmV0d29yayBkcml2ZXJz
IHNtYzkxeCBhbmQgc21jOTExeCwgYW5kCm5lZWRlZCBmb3IgdGhlaXIgcG9ydCB0byBzbGF2ZSBt
YXBzLgoKQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+ClNpZ25lZC1vZmYtYnk6IFJv
YmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgpBY2tlZC1ieTogVmlub2QgS291
bCA8dmtvdWxAa2VybmVsLm9yZz4KLS0tClNpbmNlIHYxOiBjaGFuZ2VkIC0xIHRvIFUzMl9NQVgK
LS0tCiBkcml2ZXJzL2RtYS9weGFfZG1hLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvcHhhX2RtYS5jIGIvZHJpdmVy
cy9kbWEvcHhhX2RtYS5jCmluZGV4IDk1MDUzMzRmOWM2ZS4uYjMxYzI4YjY3YWQzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS9weGFfZG1hLmMKKysrIGIvZHJpdmVycy9kbWEvcHhhX2RtYS5jCkBA
IC03NjIsNiArNzYyLDggQEAgc3RhdGljIHZvaWQgcHhhZF9mcmVlX2NoYW5fcmVzb3VyY2VzKHN0
cnVjdCBkbWFfY2hhbiAqZGNoYW4pCiAJZG1hX3Bvb2xfZGVzdHJveShjaGFuLT5kZXNjX3Bvb2wp
OwogCWNoYW4tPmRlc2NfcG9vbCA9IE5VTEw7CiAKKwljaGFuLT5kcmNtciA9IFUzMl9NQVg7CisJ
Y2hhbi0+cHJpbyA9IFBYQURfUFJJT19MT1dFU1Q7CiB9CiAKIHN0YXRpYyB2b2lkIHB4YWRfZnJl
ZV9kZXNjKHN0cnVjdCB2aXJ0X2RtYV9kZXNjICp2ZCkKQEAgLTEzODYsNiArMTM4OCw5IEBAIHN0
YXRpYyBpbnQgcHhhZF9pbml0X2RtYWRldihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCwKIAkJ
YyA9IGRldm1fa3phbGxvYygmb3AtPmRldiwgc2l6ZW9mKCpjKSwgR0ZQX0tFUk5FTCk7CiAJCWlm
ICghYykKIAkJCXJldHVybiAtRU5PTUVNOworCisJCWMtPmRyY21yID0gVTMyX01BWDsKKwkJYy0+
cHJpbyA9IFBYQURfUFJJT19MT1dFU1Q7CiAJCWMtPnZjLmRlc2NfZnJlZSA9IHB4YWRfZnJlZV9k
ZXNjOwogCQl2Y2hhbl9pbml0KCZjLT52YywgJnBkZXYtPnNsYXZlKTsKIAkJaW5pdF93YWl0cXVl
dWVfaGVhZCgmYy0+d3Ffc3RhdGUpOwo=
