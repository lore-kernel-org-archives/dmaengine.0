Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,27/27] devres: kill devm_ioremap_nocache
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20171223134532.GA10103@kroah.com>
Date: Sat, 23 Dec 2017 14:45:32 +0100
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ulf.hansson@linaro.org, jakub.kicinski@netronome.com, airlied@linux.ie, linux-wireless@vger.kernel.org, linus.walleij@linaro.org, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org, daniel.vetter@intel.com, dan.j.williams@intel.com, jason@lakedaemon.net, linux-rtc@vger.kernel.org, boris.brezillon@free-electrons.com, mchehab@kernel.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, richard@nod.at, marek.vasut@gmail.com, industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org, dvhart@infradead.org, linux@roeck-us.net, linux-media@vger.kernel.org, seanpaul@chromium.org, devel@driverdev.osuosl.org, linux-watchdog@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com, marc.zyngier@arm.com, jslaby@suse.com, jani.nikula@linux.intel.com, linux-can@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, mkl@pengutronix.de, linux-fbdev@vger.kernel.org, nios2-dev@lists.rocketboards.org, bhelgaas@google.com, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, a.zummo@towertech.it, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, lgirdwood@gmail.com, ralf@linux-mips.org, linux-spi@vger.kernel.org, ysxie@foxmail.com, wg@grandegger.com, cyrille.pitchen@wedev4u.fr, tj@kernel.org, alexandre.belloni@free-electrons.com, davem@davemloft.net, andy@infradead.org
List-ID: <dmaengine.vger.kernel.org>

T24gU2F0LCBEZWMgMjMsIDIwMTcgYXQgMDc6MDI6NTlQTSArMDgwMCwgWWlzaGVuZyBYaWUgd3Jv
dGU6Cj4gLS0tIGEvbGliL2RldnJlcy5jCj4gKysrIGIvbGliL2RldnJlcy5jCj4gQEAgLTQ0LDM1
ICs0NCw2IEBAIHZvaWQgX19pb21lbSAqZGV2bV9pb3JlbWFwKHN0cnVjdCBkZXZpY2UgKmRldiwg
cmVzb3VyY2Vfc2l6ZV90IG9mZnNldCwKPiAgRVhQT1JUX1NZTUJPTChkZXZtX2lvcmVtYXApOwo+
ICAKPiAgLyoqCj4gLSAqIGRldm1faW9yZW1hcF9ub2NhY2hlIC0gTWFuYWdlZCBpb3JlbWFwX25v
Y2FjaGUoKQo+IC0gKiBAZGV2OiBHZW5lcmljIGRldmljZSB0byByZW1hcCBJTyBhZGRyZXNzIGZv
cgo+IC0gKiBAb2Zmc2V0OiBSZXNvdXJjZSBhZGRyZXNzIHRvIG1hcAo+IC0gKiBAc2l6ZTogU2l6
ZSBvZiBtYXAKPiAtICoKPiAtICogTWFuYWdlZCBpb3JlbWFwX25vY2FjaGUoKS4gIE1hcCBpcyBh
dXRvbWF0aWNhbGx5IHVubWFwcGVkIG9uIGRyaXZlcgo+IC0gKiBkZXRhY2guCj4gLSAqLwo+IC12
b2lkIF9faW9tZW0gKmRldm1faW9yZW1hcF9ub2NhY2hlKHN0cnVjdCBkZXZpY2UgKmRldiwgcmVz
b3VyY2Vfc2l6ZV90IG9mZnNldCwKPiAtCQkJCSAgIHJlc291cmNlX3NpemVfdCBzaXplKQo+IC17
Cj4gLQl2b2lkIF9faW9tZW0gKipwdHIsICphZGRyOwo+IC0KPiAtCXB0ciA9IGRldnJlc19hbGxv
YyhkZXZtX2lvcmVtYXBfcmVsZWFzZSwgc2l6ZW9mKCpwdHIpLCBHRlBfS0VSTkVMKTsKPiAtCWlm
ICghcHRyKQo+IC0JCXJldHVybiBOVUxMOwo+IC0KPiAtCWFkZHIgPSBpb3JlbWFwX25vY2FjaGUo
b2Zmc2V0LCBzaXplKTsKCldhaXQsIGRldm1faW9yZW1hcCgpIGNhbGxzIGlvcmVtYXAoKSwgbm90
IGlvcmVtYXBfbm9jYWNoZSgpLCBhcmUgeW91Cl9TVVJFXyB0aGF0IHRoZXNlIGFyZSBhbGwgaWRl
bnRpY2FsPyAgRm9yIGFsbCBhcmNoZXM/ICBJZiBzbywgdGhlbgppb3JlbWFwX25vY2FjaGUoKSBj
YW4gYWxzbyBiZSByZW1vdmVkLCByaWdodD8KCkluIG15IHF1aWNrIGdsYW5jZSwgSSBkb24ndCB0
aGluayB5b3UgY2FuIGRvIHRoaXMgc2VyaWVzIGF0IGFsbCA6KAoKZ3JlZyBrLWgKLS0tClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFl
bmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwu
b3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jk
b21vLWluZm8uaHRtbAo=
