Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C703F25DB0D
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006624; cv=none; b=jTBKusJcg014vpskPEhH8uy48FOch5H1s9HvrHaTjLAHqgLyULEBS6nGZ1gE8qEIwH1uFsHyK6jseDt9NJt4K/2mS9vKkK4o4W+maWqwbc9d6kOZNBxSqCNEQdhwRACB3nfLmgWNmxE8ZLcsKwbBbNr3mo/kNrUU86rCFFnerg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006624; c=relaxed/simple;
	bh=FWJ3KjePe2ZLJX+PXqYTB1f050jq+4dzetuJ7W8/VgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xgud4phPMOpxkM1+tc+8bjUY7aoKrAUVUv0EA2y1VpLfAt6Kpnz7M0Mg7mgO7opsm2209sYIPQMzzctb9SyQ7exya9ju0RO9ZE9Ui/i/Tu+ssA3+2ajO1bG5sSl+arT1u284LlChvYb/xb+gcx/GjPhkUyvAHT10A6nyru+UQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2/WIv8F; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2/WIv8F"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0248cfso936635a12.1
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 19:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789006622; x=1789611422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/mwb6kq711o0zLj40CBuf88fUtmxTPuXCFlSp1xnBs=;
        b=d2/WIv8F2Wyd2NpGlu85AFM7+zqEdoJDC1N5u7bJc7Ra+t+o0FX2vaJ9d2ivROLgQd
         XagkQFwQNzsMILyedMHoaaoEiwoBXE1cp4+jEYZq2Cpy72PHrtn+yZ49zRMKm+edK/+G
         hqaA1+1yQXQ4KkXYM/jwsMrE23YCBAKPVLC67/BaSUnbCrjtZ2bC/twKraybG2IMV9T5
         vvORzSaZhB147JPy8cJlLqs6UDxxj1swYqOKsIc32kqPECSNqw2//EvoGmkeeoXgUgd5
         pEfFBi8MutP5nAesk+axrfnIazrF1G8OaA72QP5B5ABGonrwhe5CjkdJ9CP737f/wf0N
         1yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789006622; x=1789611422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/mwb6kq711o0zLj40CBuf88fUtmxTPuXCFlSp1xnBs=;
        b=UjyPvUGmBwmlbMzWS8CQinInhHJWAdt5zeAbUMQvS3h6M5AfmjvcsNu8AGSHKyWoM2
         47kGigNxlZ4mlLW/7z6pFE+iLwRjTDjAbdrTSCtHrcnBeUIcVwKCM3USXktQn9wET3Pd
         7sBqq1HEKDnOJP1WxKatHDarRTp5iv6xinGlG54QJiE05IEGa00+6jqi4VvWYf/LYycB
         NNBoJoaqpFkZzFo6pWjbtDXVH9NzuEZz/bvyaeoVqoajFMIXxJSG8I3CWgpafMxqzPG7
         kx272JcypaBY9d6qcJfy6cVzyzB9nVCIl85HYhlLhcnwt3hAZJxl1inIFkL568Sisnn4
         uQtg==
X-Forwarded-Encrypted: i=1; AKwUvBxELbWu84zLsSwJKvIt+MXy6Ova0zu2cu1NgctjA8rcxfUzqdX8ErrevmWLbiQa2Ty5i7xOmQAE9Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++lmWs3gKKmTiB+XlhjHq4RMZPGpaVSqOHEBhQQA6UVMwDK2izhK
	9Lh0dCeNTClXsxZpDaCuClYnbko0ICQZZM4sn4XKe9ppQCKUKZpGSdgXOgejnkD3
X-Gm-Gg: AYBFou2ZwBC8FjD8c9AjB3uOst39HWtSZemuchDQqUZCnEnLmxU4foXAPhf7s6SOlag
	Sqrc2lus2iuB1SCqYAdoW8PmvDt2Sju5308TLFagnsugVEV5WT+RuyHOlmykVja14yee3zXDCx8
	Sy3eYk44ppPfbVJv1mdIYxolNWYjb2f9wCny6D1jNGMFmTwJd6y4Z9Qh8AzdhyLogin3BjJPZ0t
	cDCapp7qtrHPbqQLHJY0rvoXCC/247cPKUCpZq/nOk5q2hEw7b7sntL+21400dNlhyvbTIOHTAD
	xo2xY4Iv7IYQiMvrmyL6f+ho085KmNAuIx3eqt3+/BPXPT4vhnInOdwfBHsdBB4DetS/GNI2vpD
	vVsVDWS8+kpeI7woKILbu9dErFbSa9zHH8fW2r1JFgTUpEmBg8Q9bjWNzKYEpZ4pMckmwbyQCt2
	vNfyzzQS9ABwvDxyIPcXUPx+HbUbwNQMLXtIcsaQHfuz/dz3jgDRl5x4yUaPyLxF3osX2MGPSpW
	eg=
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr56840843a91.21.1789006621810;
        Wed, 09 Sep 2026 19:17:01 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d775c02b4sm2499630a91.14.2026.09.09.19.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:17:01 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v2] dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
Date: Thu, 10 Sep 2026 10:16:52 +0800
Message-Id: <20260910021652.1296640-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqHJKbBTNrreoMuI@SMW015318>
References: <aqHJKbBTNrreoMuI@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
putting each entry into 'sg', but the entry length is read from 'sgl'
(the list head) instead of 'sg' (the current entry):

    for_each_sg(sgl, sg, sg_len, i) {
        addr = sg_dma_address(sg);
        avail = sg_dma_len(sgl);   /* should be 'sg' */

Consequently 'avail' is always the length of the first entry. For
multi-sg lists this causes out-of-bounds reads when a later entry is
shorter than the first, and silent data loss when it is longer.
Single-sg or uniformly-sized lists happen to mask the issue.

Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Changes in v2:
- Add () to the function name in the subject, per Frank Li's review.

 drivers/dma/mmp_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..e90fd2023af7 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		addr = sg_dma_address(sg);
-		avail = sg_dma_len(sgl);
+		avail = sg_dma_len(sg);
 
 		do {
 			len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
-- 
2.34.1

