Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741543A1696;
	Tue, 22 Sep 2026 23:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119882; cv=none; b=oTJ2ost+E35ppRy4kCs4VKEGsvyBZO6127ne5Ec5O0BIzPGbA3HeQRbcVp2m+kOkLJVE5GclKnhWN9MeIL6JQk1J8zeOGfy+b4ikk4z3aw4nfNKko4ma4PrSAcdFK2/yw3wYnsLkQRoACRxTXadIZrxApymiOiGPdNuaGCGKYFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119882; c=relaxed/simple;
	bh=oKIFSGoxauqOpQZHKj9kKpRUbLf5/QVtxMNCIyDg7is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKEFgdQPbGSZYIlHUG/h10Ywl214eLGLkZSfOqiIpbqP8GK68LSsAtT1R8vAls81QAJEzURn3s9zKrKmeCqqz3WiKduRqbyo8vKEXJOdiVchT3U1A7jr4A+TLlhJRnambiVpW443dEUnBBSo3QHxSZ+YqQOBkVNWNlIw86Ruqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJrHRXEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJrHRXEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DCD1F00893;
	Tue, 22 Sep 2026 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119881;
	bh=fMA6LGLTgKPhrJcvh2K8VRMUxZynTFPOMIlYNTJQWYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RJrHRXExza0VZyTIbTdDOs1ZolS/N3BlD1BFSsHWFQgXDSuE4WhjgwXSL1PZqx5iB
	 wD3M4KRo+8nKXESmgJM2a7kX8klGGwMAECPrcCY3w8GUrZuN2dynrBXzejonmkA/rt
	 SxxnKvk//HmLXGw1y8dLMLbEemDXSPSHiP2q2wGibTvXjWxZM2VDssPKDzfWCF7Jn1
	 DpgFM+naX9+XaMSBUma+NWeREA2JTFxN+Uj924rf2vEfKxaowhBGx95nj46JFmV4Z9
	 HfYOFvf/bDcFpwsGgc1Q2kLmCjYTVK7nNImay7YOnhpJzSv1aQJWjM1097p9XON5Ga
	 3i5fmweyFOiEg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:31:02 +0200
Subject: [PATCH v5 17/23] dmaengine: ste_dma40: Validate DMA specifier
 length
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-17-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index b7d228706014..31053d31a584 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2550,6 +2550,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

