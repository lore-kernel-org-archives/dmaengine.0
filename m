Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5135F5E3
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233801; cv=none; b=mo9CGXV5CmAVkRnxa7ptz2CValMcDRuhoQnlBW3ubRdUXzb1AtW33wp4xo0AdYqoi/bDC44pQXsPSGV4nDdrCKBvB6iccMchy7tAy63S+RzdyrhTzl16odZZXWW9U21y8lmiRrh6BnL/+rYNmTgql2ukIopJ3hwTCHmjPSdN72M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233801; c=relaxed/simple;
	bh=gfFshzEu8IhegW8gH8NdEfyDiL3W7wbKBDOADZWlG2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ki/H8YXStImomG/TY3Apvbs8MGPPHhVQk7FxspPukFOcgZIRFRYu2+kD9X7iPZg61+K4FwN5DwNZnx93Rd3tfppaIVrz2nhTAn+MSnQvlwG9gVD/ZlR2PMi8l0O+97TTGARoqZanotiWzc+KTIgJ7semOBoI4KP2tyk6gPQ769Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlkYfeS/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlkYfeS/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848479c9bd5so3056052b3a.3
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784233798; x=1784838598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYDjEGjYwxlAAaUy1jLazqjAp/ssF5loEQya/7wPNrA=;
        b=jlkYfeS/46TGR72G6D9oARUcCFboqGbgwZG+G+CmsfXKTbQmf963DJm6rMCGMe7H4+
         FC1ECLWyzG3+m1vyPRPHXGzZCo8gBNAgNZ7W1PqgaM9NYzDoSdbeNhnzJ4oSAoF+Gw3r
         wLjsTVhuFt2I7utYa+5fn0mrBSDzpmxkHoXn5ygsbo6Q/Tf1ADa7uCNzNFAAGYSE8yfl
         85PFqAJsZXtd4U5oc46lEvE7qVcruFGJYMb3+6gEdq7Lf4M2Eu0AHbFAlVnvhvtQAXK/
         dRqBQ0Wb81Yj4umv70BWVoywGUsWDADlhsR/Ly+260EYfxb6MK8j0p/mhCJKWqpk+Jqd
         RLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233798; x=1784838598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYDjEGjYwxlAAaUy1jLazqjAp/ssF5loEQya/7wPNrA=;
        b=mB8PMcU5nhv/b0bOgqSP+cnCHmxh0Htw+btjug+546gWVD2mgnS+PZUcaDs4bW8yww
         fVnlO5eCYiFxMnmzRTBkOl4hKRCdetLgvBvK0S87TO0wJieEyxwBYLAQPca+IClOcmjM
         tn0+qPOghJbAst5vHNpyiCLdXqMlAfvmVTpjKeAb+O84JzZQuv1HVONepKAOImBZQcJm
         S7H437isY1Qzt5Qw0nu10ouss1Cm81H24siEPYQbNPQU2+KAbTAcikBNVEwD5I5kMp4R
         2QQ1C0d8oZd9QFaaThaCRqNctRHpr9jszpcr9J5/xQBxvdBGLtviL2X9dKw+/YXy/yl4
         6e3w==
X-Gm-Message-State: AOJu0YybaMxBqvNXv696xW2nq4DQ6RKzvGz+h8ds2MFoBD4zKtIDzrww
	3v6qGxG7YpIof/xobQZg71NlopS0ZgHzDXOSbScKEBvslD2g7zYn/TYV25xJ/w==
X-Gm-Gg: AfdE7clM8f6SL6uPtoNlbyBVmi68kkrhoDlPQQ7hJagEC4Pt5xBOY2ANoZb4USYJMIK
	2kWb/MmmeGBNMdOmOeeR6i6dwzoJ3HjAwN2kY4nP1qxHz+L8ilf25Tn8LW5KtS+xg1QKkznRaDB
	3H65a56WjcQIA3GDKcHXUaaw0JNS/T5lEBO3ZhSjwy6BNZNTTQ6U0+73dFYa/7Z0kMOt93ACbWf
	ZCJzLFg8W5ef4bSDTuXgYWe5NqFMaExn5zF/XAnPQC8xIYi4+TByu23u63GmnIubCsVV0ODpCOQ
	8OGzgU3BhejEgMEKl9Y9OaPzk8FFCOzrP7Lps6GGGpLsNwomp5cdhLIRr7rDLdX/MIGPpAIEAwS
	EG0/lfUZ8gzzBkQ9WMBgZNcgvE7d3/TIqVtoXDzio//9IkHuo3hcRInm+rbx4FQmw1Cj/y0QdqD
	B5x9a/jIPt9ddFCipNF4aG5cBd1g9jA1KrX7SlAUUCItt9p7lMBPfu5HD2Vg52cQxnOyKFTeSCf
	EVB+z+CmiH+X4tY5jQQJLYxS7RMELMIHD1qBWzmk57SEmgHMduhGlE=
X-Received: by 2002:a05:6a00:3994:b0:848:32f5:4999 with SMTP id d2e1a72fcca58-84c23a2c08emr774796b3a.30.1784233798508;
        Thu, 16 Jul 2026 13:29:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26f703sm5536776b3a.17.2026.07.16.13.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:29:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/4] dma: fsl_raid: set final bit via fill_cfd_frame() argument
Date: Thu, 16 Jul 2026 13:29:47 -0700
Message-ID: <20260716202949.677290-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716202949.677290-1-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The final-frame bit is now passed as the "final" argument of
fill_cfd_frame() (as fsl_re_prep_dma_memcpy already did) and set in CPU
order before the single cpu_to_be32() store, replacing the previous
read-modify-write of the __be32 efrl32 field.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 2778d07a05e8..888f55b672a5 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -375,11 +375,11 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	for (i = 2, j = 0; j < save_src_cnt; i++, j++)
 		fill_cfd_frame(cf, i, len, src[j], 0);
 
+	/* Fill the last frame and mark it final */
 	if (cont_q)
-		fill_cfd_frame(cf, i++, len, dest, 0);
-
-	/* Setting the final bit in the last source buffer frame in CFD */
-	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
+		fill_cfd_frame(cf, i, len, dest, 1);
+	else
+		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
 
 	return &desc->async_tx;
 }
@@ -505,16 +505,16 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 			p[save_src_cnt + 2] = 1;
 			fill_cfd_frame(cf, i++, len, dest[0], 0);
 			fill_cfd_frame(cf, i++, len, dest[1], 0);
-			fill_cfd_frame(cf, i++, len, dest[1], 0);
+			fill_cfd_frame(cf, i++, len, dest[1], 1);
 		} else {
 			dev_err(re_chan->dev, "PQ tx continuation error!\n");
 			return NULL;
 		}
+	} else {
+		/* Mark the last source buffer frame final */
+		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
 	}
 
-	/* Setting the final bit in the last source buffer frame in CFD */
-	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
-
 	return &desc->async_tx;
 }
 
-- 
2.55.0

