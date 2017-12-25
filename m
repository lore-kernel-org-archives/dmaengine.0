Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,27/27] devres: kill devm_ioremap_nocache
From: Xie Yisheng <xieyisheng1@huawei.com>
Message-Id: <4d0991ec-9cd4-0c33-5560-ae9c2c762765@huawei.com>
Date: Mon, 25 Dec 2017 09:43:40 +0800
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ulf.hansson@linaro.org, jakub.kicinski@netronome.com, airlied@linux.ie, linux-wireless@vger.kernel.org, linus.walleij@linaro.org, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org, daniel.vetter@intel.com, dan.j.williams@intel.com, jason@lakedaemon.net, linux-rtc@vger.kernel.org, boris.brezillon@free-electrons.com, mchehab@kernel.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, richard@nod.at, marek.vasut@gmail.com, industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org, dvhart@infradead.org, linux@roeck-us.net, linux-media@vger.kernel.org, seanpaul@chromium.org, devel@driverdev.osuosl.org, linux-watchdog@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com, marc.zyngier@arm.com, jslaby@suse.com, jani.nikula@linux.intel.com, linux-can@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, mkl@pengutronix.de, linux-fbdev@vger.kernel.org, nios2-dev@lists.rocketboards.org, bhelgaas@google.com, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, a.zummo@towertech.it, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, lgirdwood@gmail.com, ralf@linux-mips.org, linux-spi@vger.kernel.org, ysxie@foxmail.com, wg@grandegger.com, cyrille.pitchen@wedev4u.fr, tj@kernel.org, alexandre.belloni@free-electrons.com, davem@davemloft.net, andy@infradead.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjAxNy8xMi8yMyAyMTo0NSwgR3JlZyBLSCB3cm90ZToKPiBPbiBTYXQsIERlYyAyMywgMjAx
NyBhdCAwNzowMjo1OVBNICswODAwLCBZaXNoZW5nIFhpZSB3cm90ZToKPj4gLS0tIGEvbGliL2Rl
dnJlcy5jCj4+ICsrKyBiL2xpYi9kZXZyZXMuYwo+PiBAQCAtNDQsMzUgKzQ0LDYgQEAgdm9pZCBf
X2lvbWVtICpkZXZtX2lvcmVtYXAoc3RydWN0IGRldmljZSAqZGV2LCByZXNvdXJjZV9zaXplX3Qg
b2Zmc2V0LAo+PiAgRVhQT1JUX1NZTUJPTChkZXZtX2lvcmVtYXApOwo+PiAgCj4+ICAvKioKPj4g
LSAqIGRldm1faW9yZW1hcF9ub2NhY2hlIC0gTWFuYWdlZCBpb3JlbWFwX25vY2FjaGUoKQo+PiAt
ICogQGRldjogR2VuZXJpYyBkZXZpY2UgdG8gcmVtYXAgSU8gYWRkcmVzcyBmb3IKPj4gLSAqIEBv
ZmZzZXQ6IFJlc291cmNlIGFkZHJlc3MgdG8gbWFwCj4+IC0gKiBAc2l6ZTogU2l6ZSBvZiBtYXAK
Pj4gLSAqCj4+IC0gKiBNYW5hZ2VkIGlvcmVtYXBfbm9jYWNoZSgpLiAgTWFwIGlzIGF1dG9tYXRp
Y2FsbHkgdW5tYXBwZWQgb24gZHJpdmVyCj4+IC0gKiBkZXRhY2guCj4+IC0gKi8KPj4gLXZvaWQg
X19pb21lbSAqZGV2bV9pb3JlbWFwX25vY2FjaGUoc3RydWN0IGRldmljZSAqZGV2LCByZXNvdXJj
ZV9zaXplX3Qgb2Zmc2V0LAo+PiAtCQkJCSAgIHJlc291cmNlX3NpemVfdCBzaXplKQo+PiAtewo+
PiAtCXZvaWQgX19pb21lbSAqKnB0ciwgKmFkZHI7Cj4+IC0KPj4gLQlwdHIgPSBkZXZyZXNfYWxs
b2MoZGV2bV9pb3JlbWFwX3JlbGVhc2UsIHNpemVvZigqcHRyKSwgR0ZQX0tFUk5FTCk7Cj4+IC0J
aWYgKCFwdHIpCj4+IC0JCXJldHVybiBOVUxMOwo+PiAtCj4+IC0JYWRkciA9IGlvcmVtYXBfbm9j
YWNoZShvZmZzZXQsIHNpemUpOwo+IAo+IFdhaXQsIGRldm1faW9yZW1hcCgpIGNhbGxzIGlvcmVt
YXAoKSwgbm90IGlvcmVtYXBfbm9jYWNoZSgpLCBhcmUgeW91Cj4gX1NVUkVfIHRoYXQgdGhlc2Ug
YXJlIGFsbCBpZGVudGljYWw/ICBGb3IgYWxsIGFyY2hlcz8gIElmIHNvLCB0aGVuCj4gaW9yZW1h
cF9ub2NhY2hlKCkgY2FuIGFsc28gYmUgcmVtb3ZlZCwgcmlnaHQ/CgpZZWFoLCBBcyBDaHJpc3Rv
cGhlIHBvaW50ZWQgb3V0LCB0aGF0IDQgYXJjaHMgZG8gbm90IGhhdmUgdGhlIHNhbWUgZnVuY3Rp
b24uCkJ1dCBJIGRvIG5vdCB3aHkgdGhleSBkbyBub3Qgd2FudCBkbyB0aGUgc2FtZSB0aGluZy4g
RHJpdmVyIG1heSBubyBrbm93IGFib3V0CnRoaXM/IHJpZ2h0PwoKPiAKPiBJbiBteSBxdWljayBn
bGFuY2UsIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBkbyB0aGlzIHNlcmllcyBhdCBhbGwgOigKClll
cywgbWF5YmUgc2hvdWxkIHRha2UgQ2hyaXN0b3BoZSBzdWdnZXN0aW9uIGFuZCB1c2UgYSBib29s
IG9yIGVudW0gdG8gZGlzdGluZ3Vpc2ggdGhlbT8KClRoYW5rcwpZaXNoZW5nCj4gCj4gZ3JlZyBr
LWgKPiAKPiAuCj4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBs
aW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBt
YWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92
Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
