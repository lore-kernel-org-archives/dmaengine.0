Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751385;
	b=hgJyINYRJphTl0N/W+jKO0SU9gwWSRCzo2yJBf3We9Svtau1LHcFZ+dIdN1jHa+88V5i
	 wvcTp0vZkAwMxsibgofJo8+dIfrnkUC7D/nTe9y0ZUUqumaATDqV71JX11LJJuxjM5SEu
	 vJ/F86ni1ShQbtEY2G3QdQJkXF7EAn2yyM2VzqMIQcv3FhJ+s8Md1304oewaAnVz5SBak
	 kRQBv/2Ng2zs2BxZ4q94fIoTECyd8reuW80LoS5QDunuchTnuAFPzaA7BVAAlOXNFiWED
	 5a6ikDt605/QTJ5B6P09/AiRkP0WDEKsA3fw0GQ5MwEdOFUC+j73I6uyUHSvRFP4VBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751385;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OgZmTs9uzs8pdRKuORbz9aSyual3aTnymWDUWBNFrtg=;
	b=MdMlaHAKlbZhZvZXqnIh6B39VDJOq5+yFGPWyZ45emsY4tATN9WZDZfa9afW149YEMuS
	 bQR1Bk5sGxUbTDSms3YangfTL5aAFJl8fx5iF8dmauJ2JPajmcZuTRY2lHjcZRGA88ZzC
	 mGFa/+Q1B636eWGV825vru8aSJ1AQ13RGgGQB80nuuJGzLdmPZLkJsPAk5g9sI/ymdobo
	 JK2INO0QIWvhApHltEWRExqHMhrrrD6TP70s33Hi+tZaEx1I0HtTgp4O3mcVxRyIupZRT
	 ujQHP9qV8LWEUisjjyEjQX7PIDP2FAi59Py1NfOrV4t0q2g84wzmKXyD8k8mXntKizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kHSuhjht;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=1uv3tXBB;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17C606A330;
	Sun, 15 Nov 2026 14:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E17C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kHSuhjht;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=1uv3tXBB
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751366; bh=OgZmTs9uzs8pdRKuORbz9aS
	yual3aTnymWDUWBNFrtg=; b=kHSuhjhtc217Dl4JCKN5sqwunfB7/absniB52Lj1TjppToEdgC
	b3AJeDgr3l0zscEgoEdfOOn49Smn6C7ZY8+WzF8AoVmIX6fPPZn1FKuUx363eOsdfmG+ZhjZejI
	VlKU6AFVJnGdkElB3XbHFEX09Y0Rj+y7q+hBQXsrm6h9Vla1BeJG22Lalfh+XoUe50qCxgeZGB1
	g52MskErJfCPov0Bz3LEGhrL5OUYx8ZztwivXlfVYw2OVd2IoDgZObHAfEBnat3PiGs7/o0Kjec
	DuYhayonhctvIft/AVjQgOLSO3u9t9PudRABQMQVvzSRMcppM2APdG5RvekYuyNjM2Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751366; bh=OgZmTs9uzs8pdRKuORbz9aS
	yual3aTnymWDUWBNFrtg=; b=1uv3tXBBpXvBN4IFpElSYAhraezww9Ejruf4j7S5/enKh+rRn4
	5Nvepa4bGZfev+XdsABagCng6E1UEVWmgwDQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 15 Nov 2026 17:02:45 +0300
Subject: [PATCH 3/3] dmaengine: bam_dma: Add support for immediate commands
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-qcom-bam-dma-immediate-v1-3-9a0df4ca3be1@mainlining.org>
References: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
In-Reply-To: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Sireesh Kodali <sireeshkodali1@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794751364; l=1252;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mH4bj0o0/EiISQsE2CnM8P58GWWUpb5S0zdIdjmwWgM=;
 b=A5uNZNKVxDE3GtM8gpHdPFylDYfgqGtGFN++67qnVpow9LHsjLYY+ENFL4WwnWmW9uGeaHYq9
 AB0uvskYYzbBav+sBA41Z4/KHcSU9XWiWOMBRQpFv8eJjBmsU1xU9aY
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Sireesh Kodali <sireeshkodali1@gmail.com>

Immediate commands are handled similar to regular commands that are sent
over BAM, only a different flag needs to be set. The immediate command
support is needed to implement support for IPA v2.x, which rely on BAM
immediate commands to send commands to the IPA microcontroller.

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index e62e411dc8f8..668fd15ab544 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -59,6 +59,7 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_IMM BIT(8)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -714,6 +715,8 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		do {
 			if (flags & DMA_PREP_CMD)
 				desc->flags |= cpu_to_le16(DESC_FLAG_CMD);
+			else if (flags & DMA_PREP_IMM_CMD)
+				desc->flags |= cpu_to_le16(DESC_FLAG_IMM);
 
 			desc->addr = cpu_to_le32(sg_dma_address(sg) +
 						 curr_offset);

-- 
2.56.1
