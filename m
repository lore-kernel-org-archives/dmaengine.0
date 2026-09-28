Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4C33A9C4;
	Mon, 28 Sep 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567507; cv=none; b=o6PjZRfwgM5Q79W6wE8u7INBM0Jx+rlo/p0oY1SxttZAPorz/TqGxiKQfS+5EVe80mJD8Np/U+rvtAB1RDJCTU6DV/KBQUvzQaQviA/ZH90M/QBqWb5HVMJWXezns7tQgV8YT3rWjJCklDwu8iHL5d/5Kg4U3o7NusOnQQhOV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567507; c=relaxed/simple;
	bh=w5lrekg+A4ufW1Ch3rwBighfKX+YYsOPl4Zg89QK7B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6qkMHV3qs7PO17fMwWSoZlhCJO+DcEMGaWx+nWNPayIE08eFP82fALkz9Hz7OAmrFa8PffB/645/f2OENsi0KmT+OFNOCusI3xbuQEL2HvAQ/nOO3TtyHe9ipqq2E2okgrF/cuiZOtl7OxtoPUbzEPfDA3ylBJW81CeZVNMrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IUYxuUua; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IUYxuUua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=w5
	lrekg+A4ufW1Ch3rwBighfKX+YYsOPl4Zg89QK7B4=; b=IUYxuUuai0ta1AL7BF
	KXhyl+Q08jdztJMiYftrSYevV+GM+pv7zlaOHsvA1EwAChfgK6R3F3RD6ASpJoMm
	5hYR5rbFCR6hcZvG9CQRPedd+CDOo1/2XAJM6b2lbjwnNS3pyTaCdMxlOCuifE3F
	JRyAAfPCXG0J4yqgW2bD08FHM=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBn_ww65Llq+RYpBQ--.7801S2;
	Mon, 28 Sep 2026 11:51:24 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: frank.li@oss.nxp.com
Cc: vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Mon, 28 Sep 2026 11:51:21 +0800
Message-ID: <20260928035121.2033-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <arVuKmKc8XE46R9B@SMW015318>
References: <arVuKmKc8XE46R9B@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn_ww65Llq+RYpBQ--.7801S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr43Zr1kAr18Gr1UWFWxJFb_yoW3CFg_ur
	yv9r98Cw10vr9xGFZ0grnrZrsxJ3y293WkZws8tw1fXryUZ39rGw4Fvr92yr18KF4Dtwn8
	ua4jqF4Svw1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUxpntUUUUU==
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC0xxR6Wq55Dz4ugAA3+

Hi Frank,

On Thu, Sep 24, 2026 at 01:38:34PM -0500, Frank Li wrote:
> Look like possible. Caller may reuse prevous DMA buffer. But I don't know
> how to resolve it.

How about pre-loading the pointer registers when programming the
channel? In v6, axi_chan_block_xfer_start() writes the first block's
SAR/DAR into CH_SAR/CH_DAR before setting the channel enable bit. The
hardware reloads them with the same values once it fetches the first
LLI, and in the window in between a reader observes the start of the
first block, i.e. a full residue, which is the truth for a transfer
that has not begun. A stale end-of-transfer pointer left by a previous
run can no longer be observed, so the buffer-reuse race is closed at
the source and tx_status stays free of special cases.

Best regards,
Rui Wang

