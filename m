Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [15/15] ARM: pxa: change SSP DMA channels allocation
From: kbuild test robot <lkp@intel.com>
Message-Id: <201804030207.61pqIbzh%fengguang.wu@intel.com>
Date: Tue, 3 Apr 2018 02:46:09 +0800
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: kbuild-all@01.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

SGkgUm9iZXJ0LAoKSSBsb3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToK
ClthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMvbWFzdGVyXQpbYWxzbyBidWlsZCB0ZXN0
IEVSUk9SIG9uIHY0LjE2XQpbY2Fubm90IGFwcGx5IHRvIGFybS1zb2MvZm9yLW5leHQgbmV4dC0y
MDE4MDMyOV0KW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUs
IHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwIGltcHJvdmUgdGhlIHN5c3RlbV0KCnVybDog
ICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9Sb2JlcnQtSmFyem1p
ay9BUk0tcHhhLXN3aXRjaC10by1ETUEtc2xhdmUtbWFwcy8yMDE4MDQwMi0yMzMwMjkKY29uZmln
OiBhcm0tYWxsbW9kY29uZmlnIChhdHRhY2hlZCBhcyAuY29uZmlnKQpjb21waWxlcjogYXJtLWxp
bnV4LWdudWVhYmktZ2NjIChEZWJpYW4gNy4yLjAtMTEpIDcuMi4wCnJlcHJvZHVjZToKICAgICAg
ICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMv
bWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCiAgICAgICAgY2htb2Qg
K3ggfi9iaW4vbWFrZS5jcm9zcwogICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0
byBsaW51eCBidWlsZCB0cmVlCiAgICAgICAgbWFrZS5jcm9zcyBBUkNIPWFybSAKCkFsbCBlcnJv
cnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKCj4+IGFyY2gvYXJtL3BsYXQtcHhhL3NzcC5j
OjE5OjEwOiBmYXRhbCBlcnJvcjogbWFjaC9hdWRpby5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5CiAgICAjaW5jbHVkZSA8bWFjaC9hdWRpby5oPgogICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn4KICAgY29tcGlsYXRpb24gdGVybWluYXRlZC4KCnZpbSArMTkgYXJjaC9hcm0vcGxhdC1weGEv
c3NwLmMKCiAgPiAxOQkjaW5jbHVkZSA8bWFjaC9hdWRpby5oPgogICAgMjAJI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgogICAgMjEJI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogICAgMjIJI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+CiAgICAyMwkjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogICAg
MjQJI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CiAgICAyNQkjaW5jbHVkZSA8bGludXgvaW50ZXJy
dXB0Lmg+CiAgICAyNgkjaW5jbHVkZSA8bGludXgvaW9wb3J0Lmg+CiAgICAyNwkjaW5jbHVkZSA8
bGludXgvaW5pdC5oPgogICAgMjgJI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiAgICAyOQkjaW5j
bHVkZSA8bGludXgvY2xrLmg+CiAgICAzMAkjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAgICAzMQkj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAgICAzMgkjaW5jbHVkZSA8bGludXgv
c3BpL3B4YTJ4eF9zcGkuaD4KICAgIDMzCSNpbmNsdWRlIDxsaW51eC9pby5oPgogICAgMzQJI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+CiAgICAzNQkjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiAg
ICAzNgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAg
T3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJt
YWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAgSW50ZWwgQ29ycG9yYXRpb24K
