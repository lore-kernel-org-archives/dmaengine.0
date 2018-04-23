Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/8] sh_eth: Change platform check to CONFIG_ARCH_RENESAS
From: Simon Horman <horms@verge.net.au>
Message-Id: <20180423075604.a3wwswqj2drl3m7r@verge.net.au>
Date: Mon, 23 Apr 2018 09:56:05 +0200
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDM6Mjg6MzBQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCA5YjViYTBkZjRlYTRmOTQwICgiQVJNOiBzaG1vYmls
ZTogSW50cm9kdWNlIEFSQ0hfUkVORVNBUyIpCj4gaXMgQ09ORklHX0FSQ0hfUkVORVNBUyBhIG1v
cmUgYXBwcm9wcmlhdGUgcGxhdGZvcm0gY2hlY2sgdGhhbiB0aGUgbGVnYWN5Cj4gQ09ORklHX0FS
Q0hfU0hNT0JJTEUsIGhlbmNlIHVzZSB0aGUgZm9ybWVyLgo+IAo+IFJlbmVzYXMgU3VwZXJIIFNI
LU1vYmlsZSBTb0NzIGFyZSBzdGlsbCBjb3ZlcmVkIGJ5IHRoZSBDT05GSUdfQ1BVX1NINAo+IGNo
ZWNrLgo+IAo+IFRoaXMgd2lsbCBhbGxvdyB0byBkcm9wIEFSQ0hfU0hNT0JJTEUgb24gQVJNIGFu
ZCBBUk02NCBpbiB0aGUgbmVhcgo+IGZ1dHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKUmV2aWV3ZWQtYnk6IFNpbW9u
IEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU+Ci0tLQpUbyB1bnN1YnNjcmliZSBm
cm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgZG1hZW5naW5lIiBpbgp0
aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1h
am9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwK
