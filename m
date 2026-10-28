Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147838;
	b=JxnoKMxxDAWqU59Hsg20BEWC1IK6Dfg16ae7bUi+2aIDWJm4RMFuyMQiiyv/W9DA5Yvp
	 6GaF3NUxM0pWrfkyLaerOp+6kBWS53sEcWFhtn9rpbbkC/V98kl5fESmSjUkgDy5r9mO7
	 ZRBXCOBI+5ruutSeKdok8nJ3SHwX546REA+YQnsA5gbLtjZrgUYB52KM8qwaaXAlZpGc4
	 pSVPXaAOX1E1l3h+zrJKOcDqwrZreKF0k/KalufqHDd/StjGq5a8ErBQXuRmwhPnBB6Ks
	 PC1Pgoo/Jq+5X1SI0sliDb+VNVQKwAqiC8dnK3S49vOUBhChlIxe+FdVJwGAari8+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
	b=yIwfbSdkCiNq7ACtr21XoXCrk3lBLXnodbP6pfOtxgLviGyEiMBsBVh2+tUuCKaJ8QPL
	 h7d0Yp0MxP9YbzYeOc+JS3Hx6iWQdhEg4AdeZF9IYmGTnCM30CrFFNKJjOVsbjHj1Ef/9
	 WS/KFTh41ROdGevp7/dwBSCs4obmws5/zuRs+l5zeGuWvYxCkCdMZX5CuJcEwa8isReeS
	 Xy6Mrz0YuC4o/9zKyu1rB/TJPHUfU1htqQaOqBYNzuXG/7Gm56G8hAKumFoFJF5qPRE2y
	 Y+utU0RmcS+Xvh0mLoMD+Qs6t0OBoibyLnMCq4PFfaWoUrmlrI0YwH82v+7IgdH6plw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=XqGSRFCW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30B606A329
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 00:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC30B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=XqGSRFCW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4227595e9.2
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 17:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793147836; x=1793752636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
        b=XqGSRFCWBECA4t134CNMPUEh6JdnMwR/r4aoxTsdni/ipcinmlCn3WQqkCwLtzEoFa
         P3pOHXVO0tQZ6nJst6Frk1Um7+vFPinom49jvksShnL2tEKtQys7PiSFjKC1mZg+G1FG
         F1KaI9rtqP+2S0dQShMANYGlyVWNtrwwjtlGvI6bCjjx4rjJFQiDVfOorCBunFZHo0eo
         Qjcv0dZFfpXlhx1en+nok1ISUiaDLe1VimpHGKaVEERSs9E2CVkgsZcFjXQdLt+Go9KY
         WIqydPmwRthBlNWaucBLRWLl/SC6JI66tqBqrkwEleCO+68X9hik4BHbwhhK+sc1WtFg
         S1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147836; x=1793752636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
        b=inat0AUO/FDZBW0hTab0Yc7KwVDiTZ7ujp9PwjGZdJG34O5RjIXx2MEIxwHtk2qW66
         ChhUp5c8WvWLZvfJdE8VRQCSFUx64bjwh7ZtidmqarnnK1mwkVl/dpYt6bHOx4+svO/D
         CnF4/UnRYop4XIHUTCpQMUQwUiDYi2cQ02ug46sU2QNeqYPnqfC8LoWVQYee1zRFQfC0
         VCAf/MMs8cUJtZKJf4jaQu+moBWBeyeaKZm3PjaiMuaLecVxCLm5nanWK/BamQcJnyPd
         kPphecwiY+/NW6kNhA0Jz0z0GvDsZuNeIosurzNaKjYnBcMDZ7jf+XwBKkmKScCf98LO
         KFpA==
X-Forwarded-Encrypted: i=1; AKwUvBz/JcXcOlM6dO3eZmb2FQvidgFn32p0ZIBZmDeHRXQcR8dMhttWA1p+0PaJpgCdBhpWCWHEmRHFJd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL69UV6gWwu+m3yeU0WhEzOUvvQtVB6M3Zhxt0IWZk/ML5LaWsv
	t/NcMgBfgpCMOjiykf5+HB9p5uSMF2AR060jQtcAWmKymK909Xw5MNJcStOAAjmpdys=
X-Gm-Gg: AYBFou2Rx/XvLY/UvdcV7Rvg/D4hcoldAEX1/2mRPiNbxfux3IjmUUdlbGiPiC34+7E
	McKTA2Y0xokbm8/QQ/yoH3UVKz2bAlrn5gSFAYtFpMLkA2C4UctCy1MgHZRn+ovO+qUsNBfVOiR
	WjCpeZrOrCqJWFERbe8CAL5nq1EMKHoiVSiRN0vcm/+vBVdsD/XXQcQJli1r5SPmdmV2luozHl6
	5rZ1C5z5aGaeTe4jrRUeNhnqtrrZAOExPq/xRvvEov7q27LwAc31banbXmiUdQUnbEtnny7xNwM
	URzPfzL5GJMWu3Na4k8WuXCh3njl4j4A5AKaXYwLwkh/1QQ4yd12v+E7Mj9wTk13fnpWLn3XmPi
	PWgONXlR9OXYOQrqeFN3YiSm9KhmfROpwNYDC2GAVdN5K9OZNLR1ZkMaDi6JeZbIzRkura3/yko
	fyZ8p2GSXPNrz40GmruZsIlnUVUIdSRo0TRzjJX/TLzieUzyAytN4t9UtydSzZN5AWuZpWKgM8j
	lp1sXLK5c1lPcchbbVg7wTi4cMLqPATUULt2dA5xf727umbEEjfxCEL9IW1jom02ygP0ttqD6A/
	dGGcIHvL9tpKcSOMZ3h7x7mZn54L0TjcQsesYeHF5u+nU6hNBd4MvYhQhkkFUu+5Y3vYikgCoRL
	EKobq/aN+Fvk=
X-Received: by 2002:a05:600c:1387:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4a96667b9f7mr12466015e9.5.1793147836309;
        Tue, 27 Oct 2026 17:37:16 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm8395245e9.2.2026.10.27.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:37:15 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jingyi Li <jinli@purestorage.com>
Subject: [PATCH 1/2] dmaengine: idxd: fix double free in idxd_free()
Date: Wed, 28 Oct 2026 00:37:06 +0000
Message-ID: <20261028003708.834341-2-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028003708.834341-1-jinli@purestorage.com>
References: <20261028003708.834341-1-jinli@purestorage.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idxd_free() calls put_device() on the conf device, which drops the last
reference and runs idxd_conf_device_release(). The release callback
already frees idxd->opcap_bmap, the IDA id and idxd itself, so the
subsequent bitmap_free(), ida_free() and kfree() in idxd_free() operate
on freed memory.

idxd_free() is called from the error path of idxd_pci_probe_alloc()
when idxd_probe() fails, for example when the device reports HALTED
after reset. We hit this in a kdump crash kernel, where the DSA device
fails to reset: the double free corrupts the slab and the crash kernel
dies before the dump is saved. With slub_debug=FZPU it shows up as
general protection faults on 0x6b6b6b6b6b6b6b6b.

Let the release callback do all the freeing.

Fixes: 90022b3a6981 ("dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe")
Cc: stable@vger.kernel.org
Signed-off-by: Jingyi Li <jinli@purestorage.com>
---
 drivers/dma/idxd/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..1577d22b299c 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -581,9 +581,6 @@ static void idxd_free(struct idxd_device *idxd)
 		return;
 
 	put_device(idxd_confdev(idxd));
-	bitmap_free(idxd->opcap_bmap);
-	ida_free(&idxd_ida, idxd->id);
-	kfree(idxd);
 }
 
 static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
-- 
2.43.0

