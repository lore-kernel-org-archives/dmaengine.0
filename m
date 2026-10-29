Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286950;
	b=ZJ1AMaUVDxQom1gtRnfEhk3J0ISgYp1eZMfJQtpwoQVUhGoK9UIY65Z7G7hJwh0sXp4n
	 W5pNtAHtblfTI2jMrMiKWsPpo/rHcBYMxSReanCHt2RcG/Mdp/Lr2zir5spdRtruSx3TW
	 mhhM9LGXFINBKzmjPcD/cTqq+rSdzB+oUEj2aYmCPs6cwNqe+qMLrgk5cCiV8+m5wOg/q
	 +blJtrq1ty6JiHiKi3V0eMfvtR76veoRVFwSsiaAkjk95nP7cPFctd4mPwoGN5nzrEs9s
	 GQUrbVqZkD4d4YqMtCCtPGUnPFhKRoVUkOnWaBc9YNu4l9PurR2n6CJ0ndt1tQDm4Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286950;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=td6kaJNap5lHOA9xLjt4KXsEHf+nBxgRWvMp6ArrgKI=;
	b=aSemr34wJRf4vtfJ+jweJ2dRh5yo0S+wthOPUjtLB+rDTuj1kSRNtqXmzt50IuojNnjs
	 uDjVdBTVP+ay+O1qfTZi0TbUAgm3VQkybRN2bezD+agGC0SuDAusKr4P3zwzJMuiRsLbN
	 dnlsxP0sSFxSxAylM4SMClmp42BSkTZLU9qi82TQqATdb6UrUo7w2BdZE5DDDfYd5Z407
	 eDESdC3VvTkyorTsh3A7pQvWypdZt9N0q+kr7Qe+FuBnFzakLeE5vD2Q4WZYg2xjN12pD
	 f6fJH99at5xg0TpbIrUJEG7crH+6AfTudeF9yh1lSV05yXYhcjHYDdfStzST/uc+yPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b="tL/+CULX";
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67DA606A329;
	Thu, 29 Oct 2026 15:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67DA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=tL/+CULX
Received: by chaosmail.tech (Postfix) id 7FC7D1C8AAF;
	Thu, 29 Oct 2026 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793286948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=td6kaJNap5lHOA9xLjt4KXsEHf+nBxgRWvMp6ArrgKI=;
	b=tL/+CULXm43sCFkOeTj/6pOJMpJqM+SrXqGQN/lG5c1NotoRgLocFxXZybYiBa6TEIYZkl
	qrjWSgqlqV3nQrMCkNZkoOcKcka1/qV7c+7n+tewMo315IC+h6wiHtS9WryxeT4khZnxkt
	oR2XYqh1WZ17KeFPuVd6RVg5Vss13ns=
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
Date: Thu, 29 Oct 2026 16:15:36 +0100
Cc: Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <53D3B33F-4B52-4782-B88B-B8ADA29523F5@chaosmail.tech>
References: <20261029105908.22809-1-sn125164@gmail.com>
To: Jacob Procee <sn125164@gmail.com>

On Oct 29, 2026, at 11:59, Jacob Procee <sn125164@gmail.com> wrote:
> 
> - residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
> + /*
> + * The residue drops to zero when a descriptor finishes, before the
> + * next one is loaded. If the finished descriptor's report is already
> + * in the ring at that point, the position below comes out one period
> + * ahead: with residue2 == 0 directly, with residue1 == 0 through the
> + * residue2 > residue1 branch. The next read is then behind it, which
> + * ALSA takes for a wrap of the whole buffer. Re-read until the next
> + * descriptor is loaded; the limit covers a stopped or starved channel,
> + * whose residue stays zero.
> + */

This wall of text belongs in the commit message, not in a comment.

