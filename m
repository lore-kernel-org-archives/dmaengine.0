Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B42EA151
	for <dmaengine@vger.kernel.org>; Mon,  8 Jun 2026 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888132; cv=none; b=U2ggDr3U6sFLXvp0R3kC3bVhiXbKD9lIY7jMtJCh9DqSpnTDIFILU9NEb1DHpDp7BcSYDOG0VsoXsBnFvN6gEVH5XCsC9sEfBD1VfajhwoVPSPHB8JrpGWZuQnvXDLA/BvhCbVBlwQCkNHVtbFXjbW8z4VItUFQ0TsXpN0yckT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888132; c=relaxed/simple;
	bh=YcKwHB8U71PQcf67kPqmjgufYxmAQFBtHtM+9y9QGOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoyVfdmJrDmRGsm/BZlYMtqon9+LJpKi30WG4y6/R1FQ5FZhcka6dXQNMatFRK7WBDNZG+S3f5HCTMmxLPcR5U8t7vCpf3B2x94PLuYFwTXjs7HbA8Wi+xFUnVP9f9obGJgitM74q7XM6tsS9ZfGEb+TecTLpSl7gkB0e0HffQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPALk4g9; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPALk4g9"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5175b6c4e19so43568091cf.0
        for <dmaengine@vger.kernel.org>; Sun, 07 Jun 2026 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888130; x=1781492930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=SPALk4g9cI1UaEwym8S6elTZPl5fvdtqqSFt7b2r40l1rNMdH60FF9sXDazT2tI4HQ
         qSnjSqiKLj8k+jGeuaQ5NuKLLgLrqO6twpHRWJATLE9gmAJSZ9Y/YRL6vO/EtsffGsI8
         tgzxh3/qKDup8JHxebXjWcIZIQXBlaSDaxUsM0RmG2EtqNj7u4Dji3LbFm1dP46Vh5uO
         EhQQ0AwhLkYLsI90/kIp3SwpIUw6bLot/cmGUy2Wpojl99RmYmlpf0EMKh6iO78muB3Z
         Hv31y7L3lJ6wp+lrrEoeHFNeocOkBeKhKQ4CTcAwd8Zy76aEV5sajiqC/oZ0FUZ8+6y3
         j16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888130; x=1781492930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=dHT5SThh2koOT8tijSXUq+o8vaR7LPZ570OCQDTAYyJQ9VNG9YR8amoPyQQc54UHhC
         In/xTckiUTB+86rAqZ1+tGQ76164jU0zcH7pRgfpKYtkchmrww0c56HfqThPzV+3Fmdl
         d+arLTZE8AESmAWZmc0GcBcEksptHv0iA/+YrsXwnYpC6f149MMmDtn95H6nAh9EI4kw
         wcGVXBkcqxI4unA9+6Acs4xAlbUeDyo3BmLCF+Y+uDQA6PXuWdva1siGbX5uDHsy14lZ
         rfVk3ZjIYT8TmpN8NeKi8jHOXbTkHhYKZwFXdCrD4FIq+GZD3betFfnO3dopMrBlaXCs
         dLRQ==
X-Gm-Message-State: AOJu0YxULqRmqwsQSJowRVEfC0oLxSwhCnoB5epzMU1lnBN6m6/Pg267
	AWGFcbUjjkqTN84bIPTQZAvPSiq6/1/kTpcGUGZHKw7fPhasZmIU5F0VDkWVu9KLMvs=
X-Gm-Gg: Acq92OEKckyDt6G3tMNTU5nAhi+dvVwdwGLJHpudlnPU+6GRKIzxeavLqbd62NosRzO
	kmtpy7qzAo/j3YczKLCkrTqRbTtHg0APnFw/XmCVHEG3J9Pb4bjuAuco57f7Muz/UsXNLySFVTv
	lsgnWKHyiHy7oxNpTILD0+Bj/vF1/ve2YvnWQ+codQepHt+Js9E54+Dy/MR2Nf3cw0FEdIFHkn/
	w2vQ2MCic/pieZayImMIh1UKn0ki4Zycw3RUM/JWOsvsmmyI1O8AlkHqWYhRzUHZPZso+rhaOaw
	h+UG36wLOT7GOnN0wa4xoD1PGHZXdr4nzUZ11GJqxT6LCwxxPGKQy4lZzjK0inqXmH0qLWkhnBU
	55+flT6d50FVlF5yUsyZ6tGCQnJ9wuA0ykmry1c/bKDdWIRHo7C/bW8zWIIDkFysKhXkwYSqP9q
	jrgHAkwIHd7/D5jEHRIWxzPVOLDjVchlVVI+zPpPLJAFPIbcddRnxlfgNEteYtNQ==
X-Received: by 2002:a05:622a:834d:b0:517:a133:7b91 with SMTP id d75a77b69052e-517a1337de6mr125318111cf.16.1780888129733;
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm152128986d6.28.2026.06.07.20.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] dmaengine: qcom: hidma-mgmt: Fix sysfs cleanup on setup failure
Date: Sun,  7 Jun 2026 23:08:46 -0400
Message-ID: <20260608030846.2602111-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_init_sys() creates the chanops kobject, per-channel
kobjects and sysfs files incrementally. If a later creation step fails,
the function returns without tearing down the objects already created.

Those sysfs callbacks reference devm-managed driver data. A later probe
failure can free that data while the sysfs entries and kobjects remain
registered.

Track the chanops kobject in struct hidma_mgmt_dev, unwind the sysfs
files and channel kobjects on setup failure, and register the same
cleanup with devm after successful setup.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.h     |  1 +
 drivers/dma/qcom/hidma_mgmt_sys.c | 65 +++++++++++++++++++++++++------
 2 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.h b/drivers/dma/qcom/hidma_mgmt.h
index 30e8095988bf..4fb6759e3371 100644
--- a/drivers/dma/qcom/hidma_mgmt.h
+++ b/drivers/dma/qcom/hidma_mgmt.h
@@ -24,6 +24,7 @@ struct hidma_mgmt_dev {
 	resource_size_t addrsize;
 
 	struct kobject **chroots;
+	struct kobject *chanops;
 	struct platform_device *pdev;
 };
 
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..280b3af6ec03 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -231,20 +231,52 @@ static int create_sysfs_entry_channel(struct hidma_mgmt_dev *mdev, char *name,
 	return sysfs_create_file(parent, &chattr->attr.attr);
 }
 
+static void hidma_mgmt_uninit_sys(struct hidma_mgmt_dev *mdev,
+				  unsigned int sysfs_count,
+				  unsigned int chroot_count)
+{
+	unsigned int i;
+
+	for (i = 0; i < sysfs_count; i++) {
+		struct attribute attr = { .name = hidma_mgmt_files[i].name };
+
+		sysfs_remove_file(&mdev->pdev->dev.kobj, &attr);
+	}
+
+	for (i = 0; i < chroot_count; i++) {
+		kobject_put(mdev->chroots[i]);
+		mdev->chroots[i] = NULL;
+	}
+
+	if (mdev->chanops) {
+		kobject_put(mdev->chanops);
+		mdev->chanops = NULL;
+	}
+}
+
+static void hidma_mgmt_uninit_sys_action(void *data)
+{
+	struct hidma_mgmt_dev *mdev = data;
+
+	hidma_mgmt_uninit_sys(mdev, ARRAY_SIZE(hidma_mgmt_files),
+			      mdev->dma_channels);
+}
+
 int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 {
+	unsigned int chroot_count = 0;
+	unsigned int sysfs_count = 0;
 	unsigned int i;
-	int rc;
 	int required;
-	struct kobject *chanops;
+	int rc;
 
 	required = sizeof(*mdev->chroots) * mdev->dma_channels;
 	mdev->chroots = devm_kmalloc(&mdev->pdev->dev, required, GFP_KERNEL);
 	if (!mdev->chroots)
 		return -ENOMEM;
 
-	chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
-	if (!chanops)
+	mdev->chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
+	if (!mdev->chanops)
 		return -ENOMEM;
 
 	/* create each channel directory here */
@@ -252,9 +284,12 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		char name[20];
 
 		snprintf(name, sizeof(name), "chan%d", i);
-		mdev->chroots[i] = kobject_create_and_add(name, chanops);
-		if (!mdev->chroots[i])
-			return -ENOMEM;
+		mdev->chroots[i] = kobject_create_and_add(name, mdev->chanops);
+		if (!mdev->chroots[i]) {
+			rc = -ENOMEM;
+			goto err_uninit;
+		}
+		chroot_count++;
 	}
 
 	/* populate common parameters */
@@ -262,7 +297,9 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		rc = create_sysfs_entry(mdev, hidma_mgmt_files[i].name,
 					hidma_mgmt_files[i].mode);
 		if (rc)
-			return rc;
+			goto err_uninit;
+
+		sysfs_count++;
 	}
 
 	/* populate parameters that are per channel */
@@ -271,15 +308,21 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&mdev->pdev->dev,
+					hidma_mgmt_uninit_sys_action, mdev);
+
+err_uninit:
+	hidma_mgmt_uninit_sys(mdev, sysfs_count, chroot_count);
+
+	return rc;
 }
 EXPORT_SYMBOL_GPL(hidma_mgmt_init_sys);
-- 
2.43.0

