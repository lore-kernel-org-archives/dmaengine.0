Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93539446B
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026530; cv=none; b=mAixPJLhQhtqPO1yvSFIIO9E/G/NMBmEzYhTHjA1B2jJ4lCjjAAgEQjE1BUWnPUXgcay+n3Wol1DObzNOjlzlGHT3Iw9wS+WG91ZWIbwh4x/BfoJymTYhE/sWgkT7fBzFY0qXwVkxD56yNQnQOYFZDsamcYUW46Q1+ShqByDhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026530; c=relaxed/simple;
	bh=PSTEuwtCiCiSnSbm+yg3ZdfXJqG+MiCG0/Lvut/G1Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pyvoOhefLF6+m1XUlaMtSk9O/Por5yWb3VXA3sx6vbseXh7A4PiXrNvPdXwDNut4X5eIVVja8L0qI/g1LFgUeojWI9Un9+000f0VzquipGGul9nLccsgYgW7GRomi4s3Sjunb6RLMwfRTZYJVCHZH19+eUTnWZDCicnSRJ+U6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7Jzhy4o; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Jzhy4o"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so756187a91.3
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026525; x=1789631325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsQQCoSyhi6vG3YcxotU27DLsoE/sbIXJ2Cls4B3Hng=;
        b=i7Jzhy4ob24ZDU+WhSXRU/2D1VLunOWfZ6PDRFk2/2vYsQagtNvOwIaAPzjwMhEMHM
         VgcIJ8dZnl9kFumT1p2rRJilYOnlQneWcF0Mns8iAmtiUV7tLBsvAk04MnKYGDdsV7uZ
         SOiK4faguNEh/b6DC/AVBi5s/3JGa75KxIVwyarmxG1gIAEWzTh8hDQQez9M25FTYmgD
         ZLqd1LbN6Rwsvdb/aDTjP+rf4vztWscicinnaCe372XjS1YFBcOH7N/b4Hau72gyUSLK
         Qzb/c/cV2JF88qLjDNAUWxtsjqqf68QkJW6vi7iTzPGHSwyui3C76+xr12/tQ8kJjTJO
         SKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026525; x=1789631325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsQQCoSyhi6vG3YcxotU27DLsoE/sbIXJ2Cls4B3Hng=;
        b=dU8tRr9zKriJk5FIt+nCPIVkbWIOXbG0bHL9irbiTwSYdN6MomfTScZ9+TeRJg/09F
         HsBroVp+a7P/tSszbE3+EWJzYF9sl77U9BKyp9rEQrY4Yc1IVPuqNlJYwOrSyegY+Fzn
         SeBeWy+Sn0B1Pyl+JFjFc5i5FgueaeCQyK3KW/HeVGTgTY/Jw3wKGlnfLQNEr5iWFaSs
         aNiUllnYAgjRaa54orSnaDmmoyUqUz1xu8eQ+E1b2/OwNV57vVHTJP7i4HNNAeW6UvOO
         ONrH0pvq4kU2eMTz0UhFC48GZpAa7cwE7nc/dXkihBwjZCkM0ZJYAPLojjCzCPl0mtkY
         mJbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv8I3vOTiTqJIBSktp9yR0TXoTaneSO1lC1x7QILWtzcUqELWGKVWPaf1Cy/AgRuQ8BBhHtCTBgig=@vger.kernel.org
X-Gm-Message-State: AFuF++mPyfzCGBMhUUZPF5mVMCL3ElpsUoPFHfY/AJ8gGhPH3f8NYokO
	Dffrd2YQQr/Y5oetlvglHkY6vLqiX1D8RjEqmpMp00g2E6mENEO/CVZp
X-Gm-Gg: AYBFou1Xt9jIv0zMlsqDxjnu+Ozkd+dQkk3FsryF19yR8FmgljkJBXUMqIqO4jHkbAv
	bfUoIaRuLSiM5EG7ReqLfcJ2rr+dT1JkSejBgVNoHCQZZdOtCCJAbPg8wrGi0/bNztNGTPqLImP
	BHVTNej2F8vsESZRvBoKWTjx/FN4642S032DSvx6iojvtJkkYqAhCS3xnUMrKHyeuw0y0yyikqm
	LBYLMFWXUgJVPkNajRa+gvXhn6g2CyBKKoRfAjbIL2twz5uS1DnbthM5wFSh7iIJ1AiAyMnOMGG
	MiWuVIbCvG0jbzAm+ctYskMMaOYN7qPzINR8JF1y9T7EacykKoaQtHyMZb5hqhiVx6d1MLBx25Z
	ND+41Vo3sY2VWN2PVo0mP89AJv+9Vp3Ctcv7+5VLlm4H5uhHf2Bx40E26T/QVDHoNTfBUQ8O8pj
	tSS/uzw2gITtiVtjLsKHTIXFahPe1m/jZUkokpK6S+W0dEL6Frbtj+s1RNWFMZcCozc5Zs2HHSK
	mElh/zjFYEvbZY=
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39b3d5c4449mr29495454a91.1.1789026524832;
        Thu, 10 Sep 2026 00:48:44 -0700 (PDT)
Received: from b2b4.localdomain ([124.5.96.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4314177a91.2.2026.09.10.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:48:44 -0700 (PDT)
From: SeungUk Nam <tmddnr49449@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeungUk Nam <tmddnr49449@gmail.com>
Subject: [PATCH] dmaengine: idxd: Free the minor number when cdev setup fails
Date: Thu, 10 Sep 2026 16:48:32 +0900
Message-Id: <20260910074832.15729-1-tmddnr49449@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idxd_wq_add_cdev() allocates a minor number from cdev_ctx->minor_ida for
the new struct idxd_cdev. When dev_set_name() or cdev_device_add()
fails, the error path calls put_device(), and the release callback
idxd_cdev_dev_release() only frees idxd_cdev, so the minor number is
never returned to the ida. Leaked numbers accumulate across bind/unbind
cycles, up to MINORMASK, for as long as the module stays loaded.

Free the minor number before put_device() drops the last reference on
that path.

Fixes: c311f5e92484 ("dmaengine: idxd: Fix freeing the allocated ida too late")
Signed-off-by: SeungUk Nam <tmddnr49449@gmail.com>
---

Found by code inspection; the error path was not exercised at runtime.

 drivers/dma/idxd/cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 82b07cf942ef..f1af7f0d25d3 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -573,6 +573,7 @@ int idxd_wq_add_cdev(struct idxd_wq *wq)
 	return 0;
 
  err:
+	ida_free(&cdev_ctx->minor_ida, minor);
 	put_device(dev);
 	wq->idxd_cdev = NULL;
 	return rc;
-- 
2.34.1

