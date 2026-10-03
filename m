Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEE41442D;
	Sat,  3 Oct 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022245; cv=none; b=fBDa151Pngogp1X7QfOlIpBRuQEFLe6T/992u35hhAH0otFnUnLsYWckvmTKe7YeEwXK5gwMNhl2CuJiMD1HpjbJV4jFkXCncduix/cp5o/M2I9w0AO5cAST/8YERFC/lEtOcm9USH1Z6d99xrjoAAGXLsvrXp5AreoqJCMqpss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022245; c=relaxed/simple;
	bh=H4piNk7LYmRM6sh8EcC11GJZCJ3ItfW6aN3ztQuOQOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=XPFw+718R/Gq1v3MStiTGeRh75+U1iATUIg3Vp9Xp6ZvFgX9250kx6IGfUqCrTCjmnJF2a1DY1i+tpPCeoTptEDTfzCM2qmiYcyAnuF44ZtdTI9QASN/102dJb1bsvh4mQI3coqzXI4LGCRT8NymwsS7a0Z6SPGJmziGd/jCN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PoFprmmv; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PoFprmmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=H4piNk7LYmRM6sh8EcC11GJZCJ3ItfW6aN3ztQuOQOY=; b=P
	oFprmmvwu9vJ+eKHY6PH/tFT8Yb7LG+fczg13BySK6Nt4efV0uy6+tgrkThdNglH
	nvw6oZjF1INCmg7v2JAC318UZZ+fQm+8RGdEqzuV0dYtHNBkRz/mW1o45wAR3zlw
	YgopQioryuf2Lfb9faR5PT48wql2g4QJ24AcdDNujE=
Date: Sat, 3 Oct 2026 18:09:58 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Frank Li" <Frank.li@oss.nxp.com>, "Vinod Koul" <vkoul@kernel.org>,
	"Frank Li" <Frank.Li@kernel.org>,
	"Michal Simek" <michal.simek@amd.com>,
	"Hyun Kwon" <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a
 string terminator
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261001210021.GQ944070@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
 <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
 <20261001210021.GQ944070@killaraus.ideasonboard.com>
X-NTES-SC: AL_Qu2SA/yZvUki7imcYOkdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZFaVVU2ewdjadkXA/7HvZFQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7d6a7daa.140b.1a1013df0a8.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jygvCgD3n1V31MBqK0cHAA--.63684W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRYdV2rA1HYUSwAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0wMiAwNTowMDoyMSwgIkxhdXJlbnQgUGluY2hhcnQiIDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+T24gVGh1LCBPY3QgMDEsIDIwMjYgYXQgMDQ6
NTA6MjNQTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4+IE9uIFNhdCwgU2VwIDI2LCAyMDI2IGF0
IDA1OjM0OjE1UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+ID4gT24gU2F0LCBT
ZXAgMjYsIDIwMjYgYXQgMDg6MTI6NTBQTSArMDgwMCwgSmlhbGUgWWFvIHdyb3RlOgo+PiA+ID4g
eGlsaW54X2RwZG1hX2RlYnVnZnNfd3JpdGUoKSBhbGxvY2F0ZXMgYSBidWZmZXIgb2Ygc2l6ZSBi
eXRlcywgYW5kCj4+ID4gPiBzdHJuY3B5X2Zyb21fdXNlcigpIGNhbiBmaWxsIGl0IHdpdGhvdXQg
YSB0ZXJtaW5hdGluZyBOVUwgd2hlbiB0aGUgaW5wdXQKPj4gPiA+IGhhcyBubyBOVUwgaW4gdGhl
IGNvcGllZCByYW5nZS4gc3Ryc2VwKCkgYW5kIHN0cmNhc2VjbXAoKSB0aGVuIHJlYWQKPj4gPiA+
IGJleW9uZCB0aGUgYnVmZmVyLgo+PiA+Cj4+ID4gc3RybmNweSgpIGhhcyBsb25nIGJlZW4gY29u
c2lkZXJlZCB1bnNhZmUsIGFuZCBoYXMgZmluYWxseSBiZWVuIHJlbW92ZWQKPj4gPiBmcm9tIHRo
ZSBrZXJuZWwgaW4gdjcuMi4gQSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRvIHNpbWlsYXJseSByZXBs
YWNlCj4+ID4gc3RybmNweV9mcm9tX3VzZXIoKSB3aXRoIGEgc2FmZSBlcXVpdmFsZW50Lgo+PiAK
Pj4gRG8geW91IG1lYW5zIHVzZSBzdHJuZHVwX3VzZXIoKT8KPgo+SSB3YXMgdGhpbmtpbmcgYWJv
dXQgYWRkaW5nIGEgc3Ryc2NweV91c2VyKCksIGJ1dCBhIGR1cCB2ZXJzaW9uIGNvdWxkCj5wb3Nz
aWJseSBiZSBpbnRlcmVzdGluZyB0b28gaWYgdGhlcmUgYXJlIGVub3VnaCB1c2VycyB0aGF0IGNh
bGwKPmtbem1dYWxsb2MgKyBzdHJuY3B5X2Zyb21fdXNlci4KClRoYW5rcyBmb3IgYWxsIHJldmll
d3MsIGhvdyBhYm91dCB0aGlzIG9uZT8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYx
MDAzMDk1OTIyLjU3NTM1MC0xLXlhb2ppYWxlMDJAMTYzLmNvbS8KPgo+PiA+ID4gQWxsb2NhdGUg
YW4gZXh0cmEgYnl0ZSBhbmQga2VlcCB0aGF0IGJ5dGUgemVyby1pbml0aWFsaXplZCwgc28gdGhl
IGlucHV0Cj4+ID4gPiBjb3BpZWQgcmVtYWlucyB1bmNoYW5nZWQgYW5kIHRoZSBidWZmZXIgaXMg
YWx3YXlzIHRlcm1pbmF0ZWQuCj4+ID4gPgo+PiA+ID4gRml4ZXM6IDFkMjIwNDM1Y2FiMyAoImRt
YWVuZ2luZTogeGlsaW54OiBkcGRtYTogQWRkIGRlYnVnZnMgc3VwcG9ydCIpCj4+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4gPiA+IC0tLQo+PiA+
ID4gIGRyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZHBkbWEuYyB8IDIgKy0KPj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gPiA+Cj4+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEveGlsaW54L3hpbGlueF9kcGRtYS5jIGIvZHJpdmVycy9k
bWEveGlsaW54L3hpbGlueF9kcGRtYS5jCj4+ID4gPiBpbmRleCBkOWEzNTQyYzQ1MzEuLmI2MWVm
MzA2MmQ4NCAxMDA2NDQKPj4gPiA+IC0tLSBhL2RyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZHBk
bWEuYwo+PiA+ID4gKysrIGIvZHJpdmVycy9kbWEveGlsaW54L3hpbGlueF9kcGRtYS5jCj4+ID4g
PiBAQCAtNDEwLDcgKzQxMCw3IEBAIHN0YXRpYyBzc2l6ZV90IHhpbGlueF9kcGRtYV9kZWJ1Z2Zz
X3dyaXRlKHN0cnVjdCBmaWxlICpmLAo+PiA+ID4gIAlpZiAoZHBkbWFfZGVidWdmcy50ZXN0Y2Fz
ZSAhPSBEUERNQV9UQ19OT05FKQo+PiA+ID4gIAkJcmV0dXJuIC1FQlVTWTsKPj4gPiA+Cj4+ID4g
PiAtCWtlcm5fYnVmZiA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4+ID4gPiArCWtlcm5f
YnVmZiA9IGt6YWxsb2Moc2l6ZSArIDEsIEdGUF9LRVJORUwpOwo+PiA+ID4gIAlpZiAoIWtlcm5f
YnVmZikKPj4gPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+PiA+ID4gIAlrZXJuX2J1ZmZfc3RhcnQg
PSBrZXJuX2J1ZmY7Cj4KPi0tIAo+UmVnYXJkcywKPgo+TGF1cmVudCBQaW5jaGFydAo=
