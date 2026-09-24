Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97881253B58;
	Thu, 24 Sep 2026 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238947; cv=none; b=PLV5tHY1DolzT8jMdN52Eti2BmDel1SDMbG0jT6oiQaCiSvyMmyK5+Qs9ONtO/uHfm8YNWidbF6DZ/PaD+pqVpk0xdbnG2NatoaGz+DpDY6qj8RaAQeKveiqjun6aZqsmYfsd4G68dV4GyS90Z8P42Kj6IU228uFg0wNTgUHed8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238947; c=relaxed/simple;
	bh=B4TxjbG3wKBGgE233BcKPCKoHLdChZjP41eibU1orS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9hnuEMff4uGs5KWK4C2vWO3KXeXJTpxS6ko0/f0nhc4Q5D/D+8foQR7paBo2cgsgHNVeKAYVmGHV9UNMCD3FP+pIQNJsq7YleLrzz5Jt6IYeYJoeOiSGhj9/qfZuJ1GST02wBc1YLc0Lzq63RYsgpXRm1lFiRz9Xu3pOvUYC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1OJADZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1OJADZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF991F000FF;
	Thu, 24 Sep 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238945;
	bh=5qsv+O5SuQp3yUFrL9BMWj5BZRzeGM8iI8/K1xtaam8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H1OJADZP2xaOAdVK4gWHs6uVI3k43uVh/gYy3otsI/vLbuMSYN1y8ueQHFE6OrgNN
	 nL/9I5IUKftTm2/E1LawE2nst1Jl1D1o1WHUMQAgrRTaF24ckAs59+S8rjK8kw0v/a
	 FitCSqiC02mcIu9RdpfRnEr+mDmJ56BeZEKRIwaeteOZRYl8d6NLpECPod1HGrIdIk
	 sKQ4FLYPksZDJJ83Nu+1RYD5CHuid/pybdkmwvex4vwHa6TeM1j3hMTzoqfU5Vg2rR
	 ePOW4AJxoRIr/wVzg3UnLEXLmwXRzWdGhKw46wSgM/b4n9JglMYpHPU42dKqawLM3w
	 NKOkCY4sV1DFQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:29 +0200
Subject: [PATCH v6 17/23] dmaengine: ste_dma40: Validate DMA specifier
 length
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-17-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The DMA40 binding requires three cells, but d40_xlate() reads args[0],
args[1], and args[2] without checking args_count. A malformed provider node
can specify fewer cells, leaving some of these values uninitialized when
the OF DMA core invokes the translation callback.

Reject specifiers that do not contain exactly three cells before reading
the argument array.

Fixes: fa332de5c6b3 ("dmaengine: ste_dma40: Supply full Device Tree parsing support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index ed233676e718..660ac63efb40 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2545,6 +2545,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

