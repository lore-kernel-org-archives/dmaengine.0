Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED06FC5;
	Thu, 24 Sep 2026 02:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218626; cv=none; b=vGtyHDm2by6IGxlxgud5Z8aKRM/VYFVFMQAUrVUGvMONiV8AZ22qeW2f7CoQzjdikxTYxs1iK9EF9FJ/HNOUJ8m5rZyWpBPuRVFeByjvLVJHTZzMdbYA8OLtxfqWtMwdlrnHZ6L4OmGFohK2wPJNVYwFTzm0L3SoqO+wU/UqUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218626; c=relaxed/simple;
	bh=joas2B8nxy9rc84oEdeR2EqzLlk6WelkPuMsYTPvHZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnSMNqPtR+7m9Vzumc5CAdM+0sU4a0NFOAWvFhYC95Fn1Zr8UCIHflIUKM+D+yQxHGWVDSceLYAfjtuRSljP6iC9QZCha4+JSVTLB13sw/eHA+y/izixvbplZJR3iSqkofLpe/FxA9qgy1PI5+d21EPYS2h8krtef+wNX8wS3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GbXqbT1T; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GbXqbT1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jo
	as2B8nxy9rc84oEdeR2EqzLlk6WelkPuMsYTPvHZ8=; b=GbXqbT1TVARp4m80fK
	4Q9uP5fvNvmh8WbigUuOAyvhtqFPEtLcd9/0U5pEt2Nvbq/DMQm2nf7hkK+gI512
	MyJZCpE3f2gozScdTiLcMwJ92kYVkXeRm/kRZaBtwrCsHHyD13xlXP7lhQkHVK7U
	wE2MTJZ0rkWHRN3tSR1wQGU0k=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnb6pnkbRqNBHPAQ--.7821S2;
	Thu, 24 Sep 2026 10:56:42 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: frank.li@oss.nxp.com
Cc: vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Thu, 24 Sep 2026 10:56:39 +0800
Message-ID: <20260924025639.831-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <arQnNiDh1Gp7OXUE@SMW015318>
References: <arQnNiDh1Gp7OXUE@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnb6pnkbRqNBHPAQ--.7821S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47KFyxtr48Kw1UtFy7Jrb_yoW3ArcE9a
	4rK34UGw1DuF93A34kKFZ8t3y7GF1jv3s5Ja18J3s5XryxArZ5GFWvgrn0vw1xWa93twnx
	KFWavr1I9w1SgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUFoGtUUUUU==
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9QpG3mq0kWpLtwAA3+

Hi Frank,

Thanks for the review!

On Wed, Sep 23, 2026 at 02:23:34PM -0500, Frank Li wrote:
> common pattern for this type problem is use do while loop.

Good point, switched to the do/while loop in v5.

> suppose you should call DMA done handle here. return length -1 is workaround

Agreed it was a workaround; dropped it in v5. Running the completion
handling from tx_status would race with the real completion interrupt,
which would then find no descriptor to reap, so I prefer to keep
tx_status query-only. With the chan->desc matching, a descriptor that
was never started can no longer alias the stale pointer of a previous
transfer; the remaining stale-read window is bounded by the first LLI
fetch after channel enable.

> now direct use min()

Done.

Best regards,
Rui Wang

