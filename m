Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D74417BE2;
	Wed,  2 Sep 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341215; cv=none; b=jNUG4CBRH6IoefGJy3GzCeD2jzZ835j1Z3g08I5VGjYo/a9QNOr+dRWuT433aSxNeqUw10ut51251IG77saG0K4B8ifu1wIVkmpzVBzJmhpj/gT7Jg+4bHWWVQWps/BAgW0EbPjZgKoTgcAP2Fkz3VJuWRp0XMiFcX+qG0Z/ic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341215; c=relaxed/simple;
	bh=bOofOIoyu7nVYi6NenUtKXuZTckxrh/YWOiFdf8W5n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnaQuYgGJAIC3ZaaS4MQIbkJNruflQpEBoMN79vtgnXecmW0KeCEhhS2Yt8uhSsUEp2VVcQvsECaS6h+cl2gi+8p2AnhcJZ/9WagxGNDL5c3GJvQ4d448sTqeqFXqplhSGiLUOWyJus9MOx4UZSOVacT6ZMsdGakb+/Dz63EnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=KOCmd/Fq; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="KOCmd/Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=NMLRxRJLMK5HDpwcoJZdra6d5ORXjPE
	RdZnGUWgsmkA=; b=KOCmd/FqSArVov9bTIqOH0Cs3YbhLO1a9+g1RPQHbkzaxdT
	uUle1jJTBs0OTYu9c4XfJUzMqYxEyzVZr5celDBzwGq1ghCRUl8vaG9IZ1kb2uo+
	lEhhdKhaTr5MRjCjp3eKZhYMKgwCGKMXaZQsLnZ4ize5v/DR1d63piybG5iM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAfU65dqiy0AAA--.195S3;
	Wed, 02 Sep 2026 17:26:47 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Wed, 02 Sep 2026 17:26:11 +0800
Subject: [PATCH v3 1/4] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-dma-fix-v3-1-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
In-Reply-To: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788341193; l=1915;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=bOofOIoyu7nVYi6NenUtKXuZTckxrh/YWOiFdf8W5n4=;
 b=ebT7NhzYQlERNwALzx1s6tl15BIFs0Gtnud6R72IlV4RTDyVjPNOJlsrrfc2E4BJZ+5La4sTz
 jQEZtOjMFDJBobd35ZoxgoXymjXO2ScYUl0dbaNYfW69fb+XQo+6AW7
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDHQAfU65dqiy0AAA--.195S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rKryfZFy7CFy3tr1fJFb_yoW8Zryfpa
	n5Kw4rJFyDtw1qka1kJa47uFyUtFy5KrWIvFW8Zw1S9rZ8X34Svr1kKw1F9r1kAF4rJr4f
	tF4fJFyrZF1kZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x0JUk3ktUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAA5sg

The snps,axi-max-burst-len property describes the number of beats in an
AXI burst, while the ARLEN and AWLEN fields encode that value minus one.

The driver keeps axi_rw_burst_len as the actual burst length so that
dma_device.max_burst reports the correct value. However, it also programs
that unencoded value directly into the hardware fields. A value of 256
therefore overflows the 8-bit fields and can cause AXI decode errors.

Subtract one only when constructing hardware descriptors, while keeping
the actual value for dma_device.max_burst.

Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..742e08cfab43 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -706,7 +706,7 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
 	ctlhi = CH_CTL_H_LLI_VALID;
 
 	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
-		burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
+		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
 			 burst_len << CH_CTL_H_ARLEN_POS |
 			 burst_len << CH_CTL_H_AWLEN_POS;
@@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
 
 		reg = CH_CTL_H_LLI_VALID;
 		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
-			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
+			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
 
 			reg |= (CH_CTL_H_ARLEN_EN |
 				burst_len << CH_CTL_H_ARLEN_POS |

-- 
2.34.1

