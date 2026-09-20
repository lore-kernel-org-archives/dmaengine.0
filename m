Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9480C29ACFD;
	Sun, 20 Sep 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930813; cv=none; b=Z4WZQsjrBr2c0L6dPTa9NofRGgV9gHEoRfXQgLKCmYXMsBuwoOu7gS+V/skQq90gxlhWXWkiZZWsnvezHgu0IdL7oh5IwYH4ldd3NsDytP++hmSOOICnjtjrlIxn1Q/z4fHAzWp2BLOFq7ym7Aj7BAQoTUH8wSlbNZSt5tgAAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930813; c=relaxed/simple;
	bh=LXqvKpDNknyiMM8LR+sFWoSal6lbDNjHOYAePvTTTOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKp+9bMUyaONch+YAAmp2SxtyJe/iFEpr7QtIax2g8ooQ8WlsfWv7oCjNPTnOaoKTNMlDHgxaPB9Z5tw3G8/xD5h5lKBRaysGCrABbPQYqCsreGJ3g4xrhcRXF2rn6r2WYxkfFbr9g8XZ+HEr67HS2xWynZnuLDzZVOk0NMpDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7vWarYC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7vWarYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4771F000FF;
	Sun, 20 Sep 2026 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930812;
	bh=8h5J8bq9Oexrd+rM/Wickt7PS2SvgcIUyCwX9VxYMaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e7vWarYCyLFBT4OPeU8Rb7xW5MK6qIllR+mXSuXvAk2puw74HV7XE79plX6EjGgzb
	 3ph8Y2zZLGRKHoiaedekRlwejpPnfExcF5D4Xh5CZ6R8F6dVV/rTJH4FlEW43QxQxv
	 RDb++G02uoXh34JcvGca9i8MfX4KJrJiR4hb/TiVHoD+2Bh1BFhacIqrF2DKpahbyO
	 GjPHnvbQOET0ZYR/nIL6m8n3siJyHVkXaOKUwg9VQEe9cTdSbFlFeHagmXlB08xBfW
	 aiUN27CqbNsmWHz0l/dLSCcSP14RyITnsSDeUm9wbBPEDzsn6YikGN0vvrbrw6PgfN
	 ujSMvZm7p+rvA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:52 +0200
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
Message-Id: <20260920-dma40-fixes-v5-17-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 8ae236d8270f..9db4a325b36e 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2538,6 +2538,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

