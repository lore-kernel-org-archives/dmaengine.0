Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1B4A64C6
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636322; cv=none; b=qTVET5k4tDs8DmU8P66hf4V49EP6pwiTfOa7OZ20ZmHD4tqLLk552dJOUymXDtlrDclH3WC39OwenkSCW6fqoS0Dn05Mh+6Po9lgk91ZVatGEz9RMV2ImDra95559kPYOgT18EEMatbxu2x5oTupmVz7ZPB34C59hVZTrEStVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636322; c=relaxed/simple;
	bh=/avlakguXMmmpmxG2qHgFp32krlvQif4YB7D95DFmy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlqoUiQLip2UFnhpH2AsCW7tVfQbQ1/P0h5tIlI3FcISzBLTOATRn3Q0QrEYUSiyIpztYuzuw870ne5Is6ijuymOHFz9KgVKw18mxnylvK0wnXmIsK8ATxn1zliOpcEQoZAsDmEbbOUsF+h5rH0GhdXzFSohac8uxiKycYgSy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TJjygx/b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TJjygx/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gavVwlu+nhGzOB0P+B6s/Hd+8rQIK0nzCwuiOSLmIaA=; b=TJjygx
	/buMjTNPGckLsa24QnjuiaV4x4mcUVHCLvBDHy3NMoCRDyNFNsFel78B1y68BaNT
	Bw0KrCSKK8UopfeFjD3DDXkjCJsBHSPR+cTZFTB85ZJjG8iVnLvGK+uMao9DZLoT
	fzMdtwb9PBkHkUFwgiN2daV0fH+UQDDHxKAVXrUWRiEso48gjeZnf9/Cd8zZDrn/
	w833n64qMpfI8jtZ4KQUDN11id/E34eagd8LWfcdlc2GzVPmMlr+nKD6ozlgX3vP
	YybxIsqHyRO3WGJGyGNrRr1dZBBeaEZHqZ102w1G51ye1KKILoovoOU5QWqgRSbR
	mcDMMytD+fIeSSug==
Received: (qmail 1548789 invoked from network); 10 Oct 2026 14:45:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:10 +0200
X-UD-Smtp-Session: l3s3148p1@UnzR1XtdaoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 2/8] dmaengine: fsl_raid: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:40 +0200
Message-ID: <20261010124348.19055-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/fsl_raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..967638e9c87e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -135,8 +135,8 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
 
 static void fsl_re_desc_done(struct fsl_re_desc *desc)
 {
-	dma_cookie_complete(&desc->async_tx);
 	dma_descriptor_unmap(&desc->async_tx);
+	dma_cookie_complete(&desc->async_tx);
 	dmaengine_desc_get_callback_invoke(&desc->async_tx, NULL);
 }
 
-- 
2.53.0

