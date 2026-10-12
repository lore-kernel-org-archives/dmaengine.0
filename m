Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5C4C6531;
	Mon, 12 Oct 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841133; cv=none; b=RNmRV4GjvYLx2j9R7RIGLKdK+M0xxnJ+COK8mVP40MKaQVAK7p5P8UGKupTy/+kYL/f63xBh9qVIUsraGWLHcbyuzhOR49s9aoQSeMjmMTNPQeEMQcoCBHJuHr6884B/x2bUVXLqAi/tTULmKeqBea0+yZEQgcBlSwZTGpmdSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841133; c=relaxed/simple;
	bh=9bM1859TjQtemmIMwRzqBgXQsNUyZNoL0uxTzdxlopw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gaeSAE6zwcF/5pStoB8BCppC/8tW2EV7LzbVmX7G5YCoYkUhNSzXdj2Jtlowwn+VNbd9xH0uyqqfk/i53IAynuM3mP4pxfwoyXD9zvqV1JxtmGaCApHxCA2hYT4UyDBOoxQlldjKlERBcIA0KWU0NKXXfNIjKGjXz9GJgrPmUDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQzSGNCF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQzSGNCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841128; x=1823377128;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9bM1859TjQtemmIMwRzqBgXQsNUyZNoL0uxTzdxlopw=;
  b=aQzSGNCF9krc7XRHjMAKhlp7malQnLmtDjL7e9CEabvdDT+2/NNpNxdu
   yfRk5aVl+L5+slJ8Olm2h5KGFksUyBJphIiLfsCBDfneV8DS4V1Gf0mpX
   oK2zF8I0r3NE/HhtgA2byp2MvntUvr7TiwAPclGwPbhEkCozWHJiVat45
   5UA+SUddnpDZlJvmC0v+y/wP5lOPUxHX97LLApd0qVxujP5BeRURkCRBH
   Mrh8T8rjohXu2V5GnCytsN5nhiPOPyuN2C6N0XzK8uFaywJ1cZ0MlnrPR
   /qs86ZcyWieQ7+BUqk/nO+MeLVr81D8/TrTJ6lbSDEE1eHP0uk1JjL+pr
   w==;
X-CSE-ConnectionGUID: hbUCe2CuS3+44vfu/F7fmQ==
X-CSE-MsgGUID: Ptn/9deoSVaikIVYKQw72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="459898"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="459898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
X-CSE-ConnectionGUID: /vv7zzV1Rr6pwAcTLERZIw==
X-CSE-MsgGUID: v8fWnDEMSg27swKu7Eywdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="986068"
Received: from vcostago-desk1.jf.intel.com (HELO [10.241.243.117]) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:38:39 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Mon, 12 Oct 2026 14:38:06 -0700
Subject: [PATCH 3/6] dmaengine: idxd: Fix potential double free on probe
 error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wt-idxd-fixes-v1-3-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791841118; l=2988;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=9bM1859TjQtemmIMwRzqBgXQsNUyZNoL0uxTzdxlopw=;
 b=N66drn7Kj06EJJxEvgSpG4J0DwyrO+Nh/aaSGAr7xi3gpQWzjlqj8wdfwshJD3ZnuRr8gZF1q
 IfAkw6juYnMB5wBBC9YLIRv7AqifkwTUqzWzmOyyz8sE/fcSyP0wfjb
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

On the probe error path the device is released via put_device() ->
idxd_conf_device_release(), which frees idxd->wq and the idxd->wqs,
idxd->engines, idxd->groups and idxd->wq_enable_map arrays. The
idxd_clean_*() helpers and the idxd_setup_*() error unwind paths free
the same objects, so they get freed twice.

With commit ec2d428b2e32 ("dmaengine: idxd: fix double free of wq,
engine, and group structs") we made use of the kobject lifetime to
keep track of device memory allocations. These deallocations were left
behind. Remove them as idxd_conf_device_release() is already taking
care of that.

Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
Link: https://lore.kernel.org/all/20260615103932.61828-1-bogdan.codres@windriver.com/
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4adb3f3bcd01..8cf478c5b26d 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -166,8 +166,6 @@ static void idxd_clean_wqs(struct idxd_device *idxd)
 		conf_dev = wq_confdev(idxd->wqs[i]);
 		put_device(conf_dev);
 	}
-	bitmap_free(idxd->wq_enable_map);
-	kfree(idxd->wqs);
 }
 
 static int idxd_setup_wqs(struct idxd_device *idxd)
@@ -245,11 +243,8 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 		conf_dev = wq_confdev(idxd->wqs[i]);
 		put_device(conf_dev);
 	}
-	bitmap_free(idxd->wq_enable_map);
 
 err_free_wqs:
-	kfree(idxd->wqs);
-
 	return rc;
 }
 
@@ -262,7 +257,6 @@ static void idxd_clean_engines(struct idxd_device *idxd)
 		conf_dev = engine_confdev(idxd->engines[i]);
 		put_device(conf_dev);
 	}
-	kfree(idxd->engines);
 }
 
 static int idxd_setup_engines(struct idxd_device *idxd)
@@ -308,7 +302,6 @@ static int idxd_setup_engines(struct idxd_device *idxd)
 		conf_dev = engine_confdev(idxd->engines[i]);
 		put_device(conf_dev);
 	}
-	kfree(idxd->engines);
 
 	return rc;
 }
@@ -320,7 +313,6 @@ static void idxd_clean_groups(struct idxd_device *idxd)
 	for (i = 0; i < idxd->max_groups; i++) {
 		put_device(group_confdev(idxd->groups[i]));
 	}
-	kfree(idxd->groups);
 }
 
 static int idxd_setup_groups(struct idxd_device *idxd)
@@ -378,7 +370,6 @@ static int idxd_setup_groups(struct idxd_device *idxd)
 		group = idxd->groups[i];
 		put_device(group_confdev(group));
 	}
-	kfree(idxd->groups);
 
 	return rc;
 }
@@ -388,7 +379,6 @@ static void idxd_cleanup_internals(struct idxd_device *idxd)
 	idxd_clean_groups(idxd);
 	idxd_clean_engines(idxd);
 	idxd_clean_wqs(idxd);
-	destroy_workqueue(idxd->wq);
 }
 
 static int idxd_init_evl(struct idxd_device *idxd)
@@ -459,7 +449,6 @@ static int idxd_setup_internals(struct idxd_device *idxd)
 	return 0;
 
  err_evl:
-	destroy_workqueue(idxd->wq);
  err_wkq_create:
 	idxd_clean_groups(idxd);
  err_group:

-- 
2.56.0

