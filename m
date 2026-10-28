Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147836;
	b=YJsT52aYUyeViJ21A5jKRuD5Z/zzrmBQeFznb3YS2kOlchBVkAnU5ROj0YyNZj23ctRM
	 LEgROfh9LyyslqbhGHbqsqd13wjMfPou1Sk55Pqm0/IOwAKC5VlrZ1lRsjaMULhjArnx5
	 FEBVSDCz4OxkZrl5NvzJqeHTOpjYrSx9ZHj7/XXvkS4VrtRh3cXQDUkkeoO6iCfCnnSa0
	 X8rLt5bmL8kCoyIVrR2rFfDxr/B8GrCPTYyTdbj0hJB4emEV60+giAVsoyZxlhCR7ZHHH
	 tuFdAa431Cw76ERQ9hxSrF/TaSdfmmFav76I6QehRwQ5XKo20yT2DzgChJqMEhNWMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
	b=27CNIqIInb3bSmLo2lvumJbfENF3GzM9jiYNJKb5KnXCbcobc8RlTtX87OL9RilrI7nA
	 zpjW2tECgXBbromk82Yb7kORSvHOAxq5iRdpl8j8zanLVcSqozhMxMZNH4k0AUlptPw2A
	 yMFyOX0o2ciZNVdRwA/DBcSy+8qyFRh+AAYxMnIY9FWNnwnBA20rmcClrIslM7/pRRNB/
	 bDl1VtFfoOTql3Jl9dttruPsk3UygUQ0QjJvspzZcBdHTeg4PFb7NQLuz3gViezfaChxI
	 sQrTtda8RlAbs1c3rpbURqKqvjO7gm4KBsXMZkao/7OgQBT/+tdOHAG1J/R+WRmLoJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=IXD3G9by;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E0606A330
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 00:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387E0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=IXD3G9by
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3181175e9.3
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 17:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793147833; x=1793752633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
        b=IXD3G9byXXcJsFXOmJ/1SRjCaNlwVG2N3Oh7DZzwP+Ams3mCJShobln4oKxz3bX5BI
         CxE5H4gtaYRCqmxqXD/P/jzOJkIR7UoTWkQKkS84nohXBumOpvz8HueMLdpqVvmhVJQv
         wf0l/SipxykQLolHfMY+ZzXBe3YLkZShPaThK23zSLpc/MRaoEj8w8L568cdksIFiBZm
         5ekAiZyeZ3k4cJIN8EoO46u8v/UfXetXD2psVW5BwiYLuG+s8ThbOjRPNCyWSj83VywQ
         yxzaxGQrYZHkeiOH85VEt6bF8Ym7x5egxnRuqnBCiqQAp13PkupJwCbg6UQA3uWxeuoz
         hmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147833; x=1793752633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
        b=1tar+Dl1Jt1JfZlBoPdvND0HxBfM+NDvPI5hHHvVcHLBRBK8HHX3L2OUr+Ru4HcaIy
         6M6W3XJc9bkyLP55Q46zsrjiWfBmzGaaOPSyr71jY8L/MMBBzg7HpPkozG9o+3c1AhsJ
         a9B/N1GgPKfh8l56cCxrMlRTtnSDD62wActsXfjDdGY8V2VBeAnVUB2RxZUpwtdvJ36D
         cbHZo7fh9/hT8OJ6avBOVEyNqJVquV07/bXLwBZYDUgvnVyOAesDYq8bcSqg42XbwZku
         ZY+yhWW6feyaWyn+YyxN+pmX4guZRCBefGTSI1I48h9uZLEmzwjWEegKWVV5TfR8Fcxc
         O8qg==
X-Forwarded-Encrypted: i=1; AKwUvBwjZ1Dg2wU6svJ26kLJbPVZewak0/+OpaP9Fnj03KDQvPEvjW//84SU3ZX4lMLqiK7CgJzfNzoEDR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeEm3g5mr5vsVSxiOFDe52aOrbAMYi4i4FV13NOwMgdZ6kv8X4
	xMI+sv6s6vMt3l5faVTmbVseWoV8ECmi3P6vPArfqj6/BQC+i7XirtvoGrsyNM53yNA=
X-Gm-Gg: AYBFou154NRN8lREi02/PCztSOee8A4U2/Bh6C4GvMhaot/BH0zExF9ZjQi3vdjDKq9
	2SKAugirfed2vPQJVXIhb6qxF2XD4K5k1ITBNmr7RTnRieetNwuJarLjD0D6cawUL6A3FLRMFYm
	QYbrfNBtSWY58786GEXsCO4mDaTvqaZ336qcH7j0FOg++OUdgvpGO6gN1o3sgldYJpJ/Up+azLd
	Y2tucOWic+I2c6EjDfxYkNBGegkVLNin5g/QL19fdO1HmpABSzwbNiycITMvVhXjaC9WJ9TCviY
	OmFNXNjrOVGZMzRc/8EJsoF8oIGBqYMOnz2IoLQ4mDbMoejfBcqhYb/edVAPrDIwlorIRxHTO28
	k55XUdCQi+Yl8e2T5c9Xr0jfnkGQugZ5NoFuGd/OpY7VA02QWjo0aWPfn38QKJUi64HKVN8d8xY
	QEJCmdYzT3cj55Iuy4QDhnJN+CIyUF2XpZ/PD+InxSsGz+e0PWmWVtymzmmBQishPNW3EA/OKte
	ZbiVw7HCqYYcr9LGiLE49+zwUG4qiwAJQf42/HRt9svaOQXPF3wvYJfkQuP0SUJN5HK4G2zrttn
	IGFx4PhuQ/LzWHPN5w5l+eSmvUS0TwMr3xk/jmnWn3tAPqswW/nKKBguNQr+SJrq+QMjc6Oo75N
	EJPDQQ88xg3A=
X-Received: by 2002:a05:600c:a30a:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4a967202046mr9005925e9.29.1793147833498;
        Tue, 27 Oct 2026 17:37:13 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm8395245e9.2.2026.10.27.17.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:37:12 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dmaengine: idxd: fix crashes in the probe error path
Date: Wed, 28 Oct 2026 00:37:05 +0000
Message-ID: <20261028003708.834341-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
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

When idxd_probe() fails, the cleanup in idxd_pci_probe_alloc() runs into
two bugs:

 1. idxd_free() frees opcap_bmap, the IDA id and idxd after put_device()
    has already freed them via idxd_conf_device_release() (double free).

 2. idxd_conf_device_release() calls destroy_workqueue() on a NULL
    workqueue when probe fails before idxd_setup_internals(), and on an
    already destroyed one after idxd_cleanup_internals() or the err_evl
    path of idxd_setup_internals().

We hit both in a kdump crash kernel, where the DSA device fails to reset
and reports HALTED. Depending on the kernel version, the crash kernel
either oopses in destroy_workqueue() (2) or corrupts the slab (1), and
no dump is saved.

Testing: the equivalent change was tested on 6.18.57 on 10 systems with
DSA, triggering kdump with idxd loaded in the crash kernel:

 - unpatched: 10/10 NULL pointer dereference in destroy_workqueue(),
   0/10 dumps saved
 - patch 1 only: no change, the oops in (2) happens first
 - both patches: 10/10 dumps saved; with slub_debug=FZPU, no slub
   reports and no oopses

On 6.18.18, which predates commit 3d33de353b1f, patch 1 alone fixed the
slab corruption (10/10 dumps, previously 0x6b poison faults with
slub_debug).

This series is build-tested with W=1 on top of 7.3-rc4.

Jingyi Li (2):
  dmaengine: idxd: fix double free in idxd_free()
  dmaengine: idxd: fix destroy of NULL or already destroyed workqueue

 drivers/dma/idxd/init.c  | 5 ++---
 drivers/dma/idxd/sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0

