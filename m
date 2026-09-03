Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D74F55BA;
	Thu,  3 Sep 2026 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455069; cv=none; b=UDr2ihmERcerjLMHZLYT5i05+WlvCH9Fq0GjsQika16+1M1meGK/GXPHTneQ/87uViii1kOeOwTYsFzPsphB4UKqmiTSuDaNErTYCtOd2vXnjNBUSK7KfaMjJ2EGQEn2cvcY//jaBRo4543QnavdsujqP1NpvnZBmKcStN5j7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455069; c=relaxed/simple;
	bh=NqCjFD/qIo9yq7HijWZ3Dt3dwxvlM2zIRMJfnXl1+SA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ux8oX/vJtyjN6Svpd4ezWQKkj4QLu0C1bc4ntR+OHq8ZQqGXyG39czNNqhuUyRVCIgyVciUxgUMTzp9qXOiRafjtuwCNXwmM7QlF2XD0NEuMkut+HL22a0W6T5htax59Ha8NViUDS6Rtm7CCYi8c6FG0ah3+j6NljF7roFfyIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBfjYPIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBfjYPIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B801F00A3D;
	Thu,  3 Sep 2026 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455068;
	bh=Ol8CxU7GBpL/V3HbRM/MdUKYU9ya6W2jivKBkb/Zb+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RBfjYPILSFdnq4j6XP6dyvqstCiAt6qav6y9h29/+YeVfGrgIpwZCT7udSQaVqmaD
	 5Zup7C0QIcst2nU1iWRlWYEJIIiswy3RBMZQxT9FtHGxMfSBcqJF9iUFuzOc5lZybV
	 1m/kiqBY2eUU3hgSpxONAOGjxEbbYKG2PRYjGn+B+JVpDFtEDEwqkYfoRmN6SJDGNe
	 P9u4cj7yuANMmpaXosGiPLgrvx0iGnXh7i7HUIbnNEChowUPMj0/+jrzfrqD70vkp0
	 B6g0fIcYMEvIjTF8vxK27nnlU8ENxyRodsOnaVDyOUTWQXLUsimHru0RD5l5IdQIgz
	 2Qxwr3Ht+0cUQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Harninder Rai <harninder.rai@freescale.com>, 
 Xuelin Shi <xuelin.shi@freescale.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260718235227.385108-1-rosenp@gmail.com>
References: <20260718235227.385108-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: avoid free_q underflow in
 free_chan_resources
Message-Id: <178845506569.1711546.12890477757818876315.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:25 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 18 Jul 2026 16:52:27 -0700, Rosen Penev wrote:
> fsl_re_free_chan_resources() loops alloc_count times calling
> list_first_entry() on free_q without checking whether the list still
> has entries. If descriptors remain un-acked or pending in submit_q /
> active_q / ack_q when the channel resources are freed, free_q becomes
> smaller than alloc_count and list_first_entry() returns the list head,
> causing list_del() to corrupt the list head and dereference a bogus
> pointer.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl_raid: avoid free_q underflow in free_chan_resources
      commit: d805aa5b6088b193debabaa80cc0991bfa2bd057

Best regards,
-- 
~Vinod


