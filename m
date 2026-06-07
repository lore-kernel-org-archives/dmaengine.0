Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD96284682
	for <dmaengine@vger.kernel.org>; Sun,  7 Jun 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780849891; cv=none; b=avAgq83ZAo+7MkTAj+9XHm5qBSBccPBxF5dvhfhm5o/SLo9s50h9u6usgBiNrfllG0hfHKx+uVO8eA7e3F7zvGlGxj8A+IqdUJhCiLSlDNByUXN4tk/vifzg9k+gL37LOFpA08tGVe+WSSSfKmtu8lw8XHgWrth72TtvmX3Hc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780849891; c=relaxed/simple;
	bh=wimcoFeduwwwS/y+4oRKJmv0H4adw0OCIARl89GeYC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bMJb+URr+oBsagJ+DTJ2VA79DQAHi2VE1YryfVJ746eDUFwxmkMaD6U7BxZpsZxluV1pzYtUknrJoQfXm9nv0BTgzy7pcBSVFrECSC/AZWiwDu9Ss6Er6Yrr51gC9enFxsrWzD6rT7TcxbfsOo4v/BgRJWuwK+tM+NlZEsE4AUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8gnJ/pW; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8gnJ/pW"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304d7f31215so2932688eec.1
        for <dmaengine@vger.kernel.org>; Sun, 07 Jun 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780849889; x=1781454689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=C8gnJ/pWnqBeRkGUey20uoujuXcanRcSe5gq18RVuAUQnHeZqzNAymcSkh56Mluvcd
         jyXwxyv8M4FdKzF/T6imbzlKPH9woeGXxONKgNFi62lnjOuzQlpwmAk6A2ACkLGsF9xl
         8CDRhoVo+8Jb4H4YClNI7FWqzPRa/Hj/7cbMcmfXlNC6Da4Syh8lWzY7UNWBynrdjbAn
         J32e/oJRp2SAIzDGwW1Z062c3lc6TtUzkbqlEBY3xsGAe0Rf+XWCYjA2v0GhpzYKymCu
         GzGBzjvLYQ2fXHRc5bUuxQASPnOIq8hxMz1lKICr+qaCrBrYByVg+cFJDLICK20obz/V
         Wepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780849889; x=1781454689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=Qh6p2NGMKNdqOtdI1RjloJGBvbTxuAUtj0V7nis1i68vfyuJNQvNCJMFFtwyQDLHG2
         ExY81VVMXZTcoKTQyH71trhS36PiE1OlsutC2K5qFFLC7m5Ut7QWc1PvcNLRUgxAEBem
         PDRkzaxHi9h3eZYp/SXvB4pYMbs0aW0vr2OrvwWcs2NudcMFb2Ye0RGaBWamf3Se/nil
         tc//LAU7JXzJeN/LC44Uw/X1Un7El01hpfmCKNkfN+bAB+hl+fc+aCWg31h1T3eDTcgX
         IdHJk77cxGHpOg+75i+tPCCuohJS9VRtOAUn8vZrSFMA0abzvrevWnGezD5ig3IppMZg
         BjRw==
X-Forwarded-Encrypted: i=1; AFNElJ9xPO9jjwWaa5eikTKEmqJzCKbePIOr++pjYaTFlwokTira8QgZElDHby4b2aaBDnPK93pun4fY7LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKQ3R5/NQLk7LBw4ZCzgFr9hvWBW0Aes934ZowcAps9e6T+9o
	jajHeFVEtvmg2xgDwqq8NhSFFZhBgVGQdVgv8QPIspunIiMTZqjX0Oqd
X-Gm-Gg: Acq92OG7DKhSmHQp11TvvNarJLfM2nCtm5ssqeRf+fbA/HRBd7BDvUkXJa89LL23lG6
	oeK9w4C79wq+oGwjNRtw+8NFigc76Ip1q9H4vHFxfbevQxlxBkeKK3tT1djCx4vKAlxtvQieHn4
	o+w2BJOP8wuMs52hiRT0yuWWQDEVATc0e+FFqTfsjyh+lbKxbLORiHTxDQLHUuzh3r3cVtYLb0V
	wSh5qcRFsaM5vfqNGdcslhCRwSCIBj9StjVmqhV3WuUlP5+zb1L/7o7R09NWlP7t6B8Magjq2i9
	Qa7rxKfw2qQ+hVwyIPXSn6kmAOYK/keeIEQMvU9aV9Jl9vENi9qjeubfcln2DhUbsoCuEQwT/qc
	9+hmqXAamyo1Sx3X8262znOpMTvZsUwnBBTzcRkA8bU32TVQSwm4f4bpHUCQGZJmZlTZqMsfRi7
	Qa8xyqvBnyzuPGH/7K/s82HiUkU2BOymzqBPik6m60bCNYVO1TdmwZkiEUhLPKP8t2xA==
X-Received: by 2002:a05:7300:6d07:b0:304:df0e:9dba with SMTP id 5a478bee46e88-3077b79d271mr6580259eec.31.1780849889307;
        Sun, 07 Jun 2026 09:31:29 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30777ecf9e9sm8906108eec.28.2026.06.07.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:31:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show callbacks
Date: Sun,  7 Jun 2026 16:31:19 +0000
Message-Id: <20260607163119.78717-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() and strlen() patterns in sysfs show callbacks
with sysfs_emit().

sysfs_emit() is the preferred helper for formatting sysfs output
and simplifies the implementation.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma.c          |  6 ++----
 drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 5a8dca8db5ce..7a7f302a9699 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -624,12 +624,10 @@ static ssize_t hidma_show_values(struct device *dev,
 {
 	struct hidma_dev *mdev = dev_get_drvdata(dev);
 
-	buf[0] = 0;
-
 	if (strcmp(attr->attr.name, "chid") == 0)
-		sprintf(buf, "%d\n", mdev->chidx);
+		return sysfs_emit(buf, "%d\n", mdev->chidx);
 
-	return strlen(buf);
+	return 0;
 }
 
 static inline void  hidma_sysfs_uninit(struct hidma_dev *dev)
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..9672ef9ee8fc 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -102,15 +102,12 @@ static ssize_t show_values(struct device *dev, struct device_attribute *attr,
 	struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
 	unsigned int i;
 
-	buf[0] = 0;
-
 	for (i = 0; i < ARRAY_SIZE(hidma_mgmt_files); i++) {
-		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0) {
-			sprintf(buf, "%d\n", hidma_mgmt_files[i].get(mdev));
-			break;
-		}
+		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0)
+			return sysfs_emit(buf, "%d\n",
+					hidma_mgmt_files[i].get(mdev));
 	}
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values(struct device *dev, struct device_attribute *attr,
@@ -143,15 +140,15 @@ static ssize_t show_values_channel(struct kobject *kobj,
 	struct hidma_chan_attr *chattr;
 	struct hidma_mgmt_dev *mdev;
 
-	buf[0] = 0;
 	chattr = container_of(attr, struct hidma_chan_attr, attr);
 	mdev = chattr->mdev;
+
 	if (strcmp(attr->attr.name, "priority") == 0)
-		sprintf(buf, "%d\n", mdev->priority[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->priority[chattr->index]);
 	else if (strcmp(attr->attr.name, "weight") == 0)
-		sprintf(buf, "%d\n", mdev->weight[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->weight[chattr->index]);
 
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values_channel(struct kobject *kobj,
-- 
2.34.1

