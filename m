Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650571;
	b=WJIDWNobz5xOdtBdAknZ3+ttZDRoOCVKVdLwoLkb2/JTSFC+56jk0kFXezVxMuJjyyEW
	 +sIN25XKNwLgSUmNALf2TlFIUdXEcHcjZ+381jclCdtYEVDUJm9zaBsZt2gAwWpKx8hTs
	 Z8xjw865pdWf9ukkOona3ABtjJ+ZSug2HXW4H9U9SzflT6JbffJrUWw7PfjcW5jCb01CN
	 qbZLG6manvpcDnSTMmLII6tGgngtsLJxFzYan20Cy2YV6A24FwsEaVpdMI0ARGNaYcuvj
	 tQNTxqbgQ5GfcjyRcpXjbrjgy7SnZxDSqz5rGXNPqIbuMpMBJzP+ekS0hBF0ETYqRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650571;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6fN5duMnfnCJSDb0zArp5P2k6KZSkFVuApGoqZRUelw=;
	b=1tr+0QJ+ALlC/sD5kFZiqUxyNw0+a2bpINTf4zpNhnAmHlPP+U3dGI9A/k8mpShgmFSD
	 hrBcw6N+ErSu6rwMdbIp0lrGO/71Xx6p7FVHi7vRanNLYu1NzJ9MT1ffEPRFsaA1jK0I+
	 E9FmxFnRinYMtK5UabWWu57xvk5PkslQ8gi3C1qkw7Sh9vWp4SQZ/P9vWwWzBuW5FCBCW
	 jNgtJgoEN4VjvBSsbvprIWdVqVgnKPvSldyc2Pzp2EKArk2NYo2i6ioueyT5iDkTX3tAj
	 Ct7uGkdqfb/Ab3JwX/QPaVbx/8Elz4aDzuumqUIb4oNO3ISHghonVeqDXeaBRUdIQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLioAOCX;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C67606A68D;
	Wed, 25 Nov 2026 23:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C67606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLioAOCX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650571; x=1827186571;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=A6U8X1YiK/i6uxtPvC0C3LEDOycK5f55oEjqUNB7RQU=;
  b=QLioAOCXcFsw1pw8cGLWOcNewkS4JhySgsYBL36IvzmcJzUdZsVYt8aK
   EbbckRPnFel9Fo39vFwA+lU6EzH/LAolK63SFnD3fXnhxyAwuHh84olXS
   C3grDSn20JUrMRYJmHnHJYsxNuJSozy0+lT1+li7nwemyrm1knA+TbP1b
   Qs5EJEEhpwFELxUtqCxQ5imR9gyE9gl4kv/FikTraIhb1bMewqdW5MDEd
   jvU4EbfS59BEvBnbxNkrhUnpCxZM3LiMeoyCuvHNeyWh474ZD8ni7J6Je
   mdA5D6GjIV+2KjkzoK+bQp2x3u3iLU/yh+AVLNLEegou9DfzH7s+my42A
   w==;
X-CSE-ConnectionGUID: +X9+pw4iTFOD8tb/urjD9w==
X-CSE-MsgGUID: jTv6G/l7TsytVHd7I8zcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4597294"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4597294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
X-CSE-ConnectionGUID: H9lWDj/HTvaew+CUlQIsJw==
X-CSE-MsgGUID: 2rHDEgx2QtWmFqhzQTgs+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11873840"
Received: from vcostago-desk.jf.intel.com (HELO [10.241.240.61]) ([10.241.240.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 25 Nov 2026 15:49:04 -0800
Subject: [PATCH v2 6/8] dmaengine: idxd: Initialize the WQ XArray before
 the WQ can be released
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-wt-idxd-fixes-v2-6-25a4691dfb9e@intel.com>
References: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
In-Reply-To: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650562; l=1297;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=A6U8X1YiK/i6uxtPvC0C3LEDOycK5f55oEjqUNB7RQU=;
 b=A6T5ibewsM1WQGLWd3glvU3gMK2OCyEPI8e5FeQUVkpQpIuFEEQ4d4JGCMpfp4zLOr9d7OL8e
 gotOSUhg+91ANqTgWHRnq77yvT5zS1WJ+jsspYHoPW/9avZvz3lSjHj
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

idxd_setup_wqs() initializes wq->upasid_xa and wq->uc_lock last. Its
error paths call put_device() on the WQ device before that, and the
release callback, idxd_conf_wq_release(), calls xa_destroy() on the
uninitialized XArray.

Initialize both before device_initialize().

Fixes: b022f59725f0 ("dmaengine: idxd: add idxd_copy_cr() to copy user completion record during page fault handling")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 9cfb165a1569..e5b797c0ffef 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -197,6 +197,8 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 		conf_dev = wq_confdev(wq);
 		wq->id = i;
 		wq->idxd = idxd;
+		mutex_init(&wq->uc_lock);
+		xa_init(&wq->upasid_xa);
 		device_initialize(conf_dev);
 		conf_dev->parent = idxd_confdev(idxd);
 		conf_dev->bus = &dsa_bus_type;
@@ -231,8 +233,6 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 			}
 			bitmap_copy(wq->opcap_bmap, idxd->opcap_bmap, IDXD_MAX_OPCAP_BITS);
 		}
-		mutex_init(&wq->uc_lock);
-		xa_init(&wq->upasid_xa);
 		idxd->wqs[i] = wq;
 	}
 

-- 
2.56.1

