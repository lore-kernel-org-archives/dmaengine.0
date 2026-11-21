Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288990;
	b=PokKyaU7hoURxXiNJIJ872GgBaic657KKGMH6Q2KYo9JcnAPRjxlF7KUZ+jT/vtdk+35
	 pKBKNN0OVfNF7I3WVfsEoPtU7vbbzJ8ie+EF2NdpzsDyxgSSmiJQUWw2oGjqabqy9TKsC
	 P/PVJXSzv/Kw5on2ND6CAmcjYvN9flv2vuVSVzx1OrfWe3bHJvnwTpXP3uNkmhyIRCaZF
	 9aLr9NIqgiCL0HNVWlQ9xT1zsF7+8tQ1I9m7KUnHN9+px4utoc5mtvyC0AJrjrXfGqpTj
	 GMR0JNs/i7VbRloz7/Rl5rcm8RT2yaoih4xPTr8d0Ham82875OR+YHHd5aeNMVchlPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288990;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eudVbarcZvsE4BqivkeVXEbFTKihKtsMtxNl4+n5yLc=;
	b=Ks4y2aZxoj5hVzkGI250XXDjxAE3lmSdxN2mD10s7Nr/BZKsAPzEoh5oQRR0kh5xiHTF
	 n/jHG1jR2l1p0ZMn5SLeXkkoriVVLD/pXYEG18Ie54aK4la6K4doioC33cvNjbrHG2YrL
	 kTBJJelbLZMEpeojs+EmpF00er1xqJbxZcm8SNJj3WXukN2qp5zCvSBijiXTqrLMLXVtz
	 4KcCg7wD+WUNvqyKJfK2HrJ1rxm0AuhCsORVmEJOE2wr1p0cBBi/2S399QUDY0lxWvXYn
	 wkw5D396eAhGRZQIL/tGM2P294nfAwAedBaEuGba3Yjgu45BnWZ/ZYGA53SVF8lXI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hM0lKiGI;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1E606A320;
	Sat, 21 Nov 2026 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hM0lKiGI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=eudVbarcZvsE4BqivkeVXEbFTKihKtsMtxNl4+n5yLc=; b=hM0lKiGI6MojnFuJTwVvaMehDL
	NcchgnuwGG1M0VOUjByC05SOK+l6a0z0jJZDCcXjwzncTquS7WfVT577jAacisj7NiiDM8rpUsmaS
	vLBQAKPk4ThMjezWTPshwwPXMlCKjkbL+9PrN3bJUS5q/kAr8RMXGWnNL/Lq4reWoQI6M0q/8Myg0
	/apseOSpWXkt/SwR79Rwx4ZGoz2chrfKUsA/NpKBwdLCi8HAgmBS7ZlcXBxFypRQUnioBo3UgLSuM
	zL5SNUpWtv8r0Lxssr2AxycECGKUdJ9FoGtGm81Mv0xNxHFnDc/9DO5TIqYuEjAK3Y7kKAOzYjoPW
	o4vSfbjw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqfy-000000006aP-3vZK;
	Sat, 21 Nov 2026 19:23:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: [PATCH] dmaengine: mpc512x_dma: add missing MODULE_DESCRIPTION()
Date: Sat, 21 Nov 2026 11:23:06 -0800
Message-ID: <20261121192306.928291-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing MODULE_DESCRIPTION() that is now required.

WARNING: modpost: drivers/dma/mpc512x_dma.ko: missing MODULE_DESCRIPTION()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org

 drivers/dma/mpc512x_dma.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20261118.orig/drivers/dma/mpc512x_dma.c
+++ linux-next-20261118/drivers/dma/mpc512x_dma.c
@@ -1119,5 +1119,6 @@ static struct platform_driver mpc_dma_dr
 
 module_platform_driver(mpc_dma_driver);
 
+MODULE_DESCRIPTION("MPC512x and MPC8308 DMA driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Piotr Ziecik <kosmo@semihalf.com>");
