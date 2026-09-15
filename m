Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD944BB7E2;
	Tue, 15 Sep 2026 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493787; cv=none; b=i1iC6CoX+iIHtWEEWEPu23CNvUG+Bg2sFlPcrWj/4cZzoeHTd0648YDcSRQlxNK5211eKVARNSr3hI9qfiwuazJd0StyKzYQS9Lil/BUadNplN5AGlFaSGiUVP7/VqHp0hDOEupDRdtP7Ne6Al3OUmsiLJdS3KymjEf098tNfUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493787; c=relaxed/simple;
	bh=nacLeUxb4kMgv/hJKMzSScv98ZbXFSkeHm1r7UL0TDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K8BXLhH4ucQUM6oHYr5O6ocXsA4Uiwt2KASrzhzJQnvdrzgL2U/zwP/kEKRjURAJP4QDo29Y+HCveBQIUxcBJobPqhBKLwN0RE9FM8cUOgZbJRdwRgOYx82rs3sDzvcsnDFpskzRkW/Zz18ygYbbtPSXurR+6lYFuHmPZKVBI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG0UL3Jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG0UL3Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED491F00893;
	Tue, 15 Sep 2026 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493784;
	bh=GfOztx6bTifHyuZnfSYdYoqfWnHstV08fV39dJMhPuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CG0UL3JyT8lTVtvJXwKT2RahrhVwgS0ioc8VVytFp1pl002+72RfC6H/lZePuvo3e
	 oe5T7xCkrdzH/1yX9yZpKH953kBXfMpyk1TT1tOwyMkxNRLcEPqZfqSNVzKnwWAk26
	 f+e0MwjQjxObBiM81oItU2Oj6DvEiZxyKcLZLXmhO/anDGjzYBLGq7mZFc/b26E+CH
	 mHf6oR9VuTBE84usSNo+PHvhdd155s1cqiSg78JGuXemBeBFWlu/BUvJ32YdTgpuQi
	 OplMGQ+YVC45NAKxdtimzuUf8slu1nXkG5iaa4HpIdM4hWytUm9wdID4iD53tAQTyx
	 hwTYol2Y11M+A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>, 
 Dan Williams <djbw@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Nicolas Pitre <nico@marvell.com>, Lennert Buytenhek <buytenh@marvell.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909234601.101883-1-rosenp@gmail.com>
References: <20260909234601.101883-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: kill tasklet on channel add error
 path
Message-Id: <178949378183.248239.15139864627876288604.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:21 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 16:46:01 -0700, Rosen Penev wrote:
> If request_irq() succeeds but a later step (self-test or device
> registration) fails, the error path at err_free_irq frees the IRQ
> but does not kill the tasklet.  A previously scheduled tasklet can
> still run after the channel is freed, accessing freed memory.
> 
> Add tasklet_kill() after free_irq() on the error path.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mv_xor: kill tasklet on channel add error path
      commit: bcb4d469b19d53dc21e4a1da12d4438e7489e150

Best regards,
-- 
~Vinod


