Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160108;
	b=JD4oaE+QSfPHzOsiJLmhUNhP6ekFGEHmkhlhZ+m0M2gs2dpjYEYB772avnXJc81Pb/u7
	 YUh5ePeFi8A4FITDvm4xKqoqEiddPogbmVjuo9Mnss6mBMXNA0YjwKSmGMKor0/UG5XmK
	 /1A6VPbHy8Nlo2dRk+0nA7UywvDgTYRCJdmgsQPt9OUz2Pb1AwwlglKiCxgcnqSFcLh7z
	 xYp/zUNLvGuAUNF+lSrJDgqwTZsS6p13a9NGEE+W0fuk+zUI2wV7khUBmlzFBNFR0IRJt
	 /CdrPMXjLzrYYGD/P+EUyddDDmjOYKdTZZW8t/9lBzuESdz+4ACROk3XId6YaNUbPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160108;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kec65nPuayZJIdLamceFeb78dl+Li2+/4Nk8tZLJLo4=;
	b=LWvxIdctitxcuiKR6H0x7WvxgUAWv5Av5M3y3iPz4hIB/kOO2kxE4dvyxTiWYp64RoOl
	 9e9JN2Jd0Qf5wYoCMxY8xzOp0mZ7pdcUceMIrJjAgILI4ymgZNb6uIB7iXYeoPldX7WrA
	 embd104C/ELjnnaw9595WPSI7cr7/Lk4+9I2MhO50iXe69CgJicoPkaB5qn5mO4g+9+U6
	 Z2u+NabsU5fOnclHnOKJlMrXeGskT6tVsMJbZYSq1EsaU/fjCK/+7mq2DuCyjzCDLgbLN
	 iNS0xv289pzHqyPJwvP+mQ7IMF+X3uyCAJtDs1nc9i9a2aAbqgfNxfkD/cnWVXTcYOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jpaswRm9;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D0F606A320;
	Fri, 20 Nov 2026 07:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jpaswRm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jpaswRm9sWgP5G2bbC4Y0YN9Q90tOhB07cIN7rZW1NhieFDYMCQ9kIxha/yG4oUzJNnLvXu8mH12E
	 h9RZth6WNI7ChB27YoKz3m5tsN/CUesLSFIIlZ610gQd0R7PfCwa2KqUya9jusWuo9piaop+mFSW1J
	 tTfUA4Loagwara58=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afff8228b4-c601f;
	Fri, 20 Nov 2026 15:35:02 +0800 (CST)
X-RM-TRANSID:2ee86afff8228b4-c601f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afff824879-1b755;
	Fri, 20 Nov 2026 15:35:01 +0800 (CST)
X-RM-TRANSID:2ee66afff824879-1b755
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	amelie.delaunay@foss.st.com,
	Frank.Li@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend()
Date: Fri, 20 Nov 2026 15:34:59 +0800
Message-ID: <20261120073500.333-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
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

Hi Vinod,

gentle ping on this patch:

  [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend()
  https://lore.kernel.org/r/20261102104432.873-1-laixiangwu@cmss.chinamobile.com

stm32_mdma_pm_suspend() takes a runtime PM reference with
pm_runtime_resume_and_get() and returns -EBUSY without dropping it when
a channel is still enabled, so each aborted suspend leaks one
reference.  The patch adds the missing pm_runtime_put_sync() on the
-EBUSY path.

The patch carries both Reviewed-by tags since early November:

  Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
  Reviewed-by: Frank Li <Frank.Li@kernel.org>

The sibling fix for stm32-dma is pending on the same topic as well
(Reviewed-by: Amelie Delaunay and Frank Li):

  [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in pm_suspend()
  https://lore.kernel.org/r/20261102104108.794-1-laixiangwu@cmss.chinamobile.com

Could these two be queued for the next merge window?

Thanks,
Xiangwu Lai


